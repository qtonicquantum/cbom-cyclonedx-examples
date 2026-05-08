#!/usr/bin/env bash
# validate-all.sh — validates every *.cbom.json with TWO independent CycloneDX 1.7 validators
# PLUS additional semantic checks: specVersion exact 1.7, bom-ref uniqueness, dependency-ref
# resolution, nistQuantumSecurityLevel range, cryptoFunctions enum.
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"
python3 - <<'PYEOF'
import json, sys, glob
from pathlib import Path
import jsonschema, cyclonedx
from cyclonedx.validation.json import JsonStrictValidator
from cyclonedx.schema import SchemaVersion

schema_dir = Path(cyclonedx.__file__).parent / "schema" / "_res"
candidates = sorted(schema_dir.glob("bom-1.7*.schema.json"))
if not candidates:
    print("ERROR: no CycloneDX 1.7 schema found in cyclonedx-python-lib")
    sys.exit(2)
schema = json.loads(candidates[0].read_text())
js_validator = jsonschema.Draft7Validator(schema)
cdx_validator = JsonStrictValidator(SchemaVersion.V1_7)

files = sorted(glob.glob("examples/**/*.cbom.json", recursive=True))
if not files:
    print("ERROR: no *.cbom.json files found under examples/")
    sys.exit(2)

valid_funcs = {"generate", "keygen", "encrypt", "decrypt", "digest", "tag", "keyderive",
               "sign", "verify", "encapsulate", "decapsulate", "other", "unknown"}

fails = 0
for f in files:
    text = Path(f).read_text()
    bom = json.loads(text)

    if bom.get('specVersion') != "1.7":
        fails += 1
        print(f"FAIL {f}: specVersion={bom.get('specVersion')!r}, expected 1.7")
        continue

    refs = [c.get("bom-ref") for c in bom.get("components", []) if c.get("bom-ref")]
    if len(refs) != len(set(refs)):
        dupes = [r for r in refs if refs.count(r) > 1]
        fails += 1
        print(f"FAIL {f}: bom-ref collision: {set(dupes)}")
        continue

    valid_refs = set(refs)
    if subj_ref := bom.get("metadata", {}).get("component", {}).get("bom-ref"):
        valid_refs.add(subj_ref)
    bad_dep = False
    for dep in bom.get("dependencies", []):
        ref = dep.get("ref")
        if ref and ref not in valid_refs:
            fails += 1
            bad_dep = True
            print(f"FAIL {f}: dependency.ref {ref!r} not declared")
    if bad_dep:
        continue

    for c in bom.get("components", []):
        nl = c.get("cryptoProperties", {}).get("algorithmProperties", {}).get("nistQuantumSecurityLevel")
        if nl is not None and not (0 <= nl <= 6):
            fails += 1
            print(f"FAIL {f}: nistQuantumSecurityLevel={nl} out of range")

    for c in bom.get("components", []):
        funcs = c.get("cryptoProperties", {}).get("algorithmProperties", {}).get("cryptoFunctions", [])
        for fn in funcs:
            if fn not in valid_funcs:
                fails += 1
                print(f"FAIL {f}: invalid cryptoFunction {fn!r}")

    js_errs = list(js_validator.iter_errors(bom))
    cdx_err = cdx_validator.validate_str(text)
    if js_errs or cdx_err is not None:
        fails += 1
        print(f"FAIL {f}: jsonschema={len(js_errs)} cyclonedx-lib={('OK' if cdx_err is None else 'FAIL')}")
        for e in js_errs[:3]: print(f"  jsonschema: {e.message[:160]}")
        if cdx_err: print(f"  cyclonedx-lib: {cdx_err}")
    else:
        print(f"PASS {f} (both validators + semantic checks)")

print("---")
print(f"checked: {len(files)}, failed: {fails}")
sys.exit(0 if fails == 0 else 1)
PYEOF
