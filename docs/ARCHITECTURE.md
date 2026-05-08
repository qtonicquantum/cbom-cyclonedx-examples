# Architecture

A flat collection of reference CycloneDX 1.7 CBOM documents with supporting validation tooling.

## Layout

```
cbom-cyclonedx-examples/
├── README.md
├── CHANGELOG.md
├── CODE_OF_CONDUCT.md
├── CONTRIBUTING.md
├── CODEOWNERS
├── LICENSE             # MIT — applies to scripts and tooling
├── LICENSE-CONTENT     # CC-BY-4.0 — applies to .cbom.json content
├── SECURITY.md
├── Justfile
├── docs/
│   ├── METHODOLOGY.md
│   ├── LIMITATIONS.md
│   └── ARCHITECTURE.md
├── examples/
│   ├── nginx/
│   ├── openssl/
│   ├── java-jdk/
│   ├── python-venv/
│   ├── go-binary/
│   └── node-app/
├── scripts/
│   └── validate-all.sh
└── .github/
    ├── workflows/
    │   ├── validate-cbom.yml
    │   ├── lint.yml
    │   └── release.yml
    ├── ISSUE_TEMPLATE/
    │   ├── bug.md
    │   └── feature.md
    └── PULL_REQUEST_TEMPLATE.md
```

## Each example directory

Two files per directory:

- `<stack>.cbom.json` — the CycloneDX 1.7 CBOM document.
- `README.md` — short description and validation instructions.

## Validation flow

`scripts/validate-all.sh` walks `examples/**/*.cbom.json`, loads each file, and validates against the bundled CycloneDX 1.7 JSON schema. The same script runs in `.github/workflows/validate-cbom.yml` on every push and pull request.

---

From Qtonic Quantum — leading quantum risk and vulnerability intelligence tools and services. Visit https://qtonicquantum.com.
