# Methodology

How the CBOM examples in this repository are constructed.

## Standards Referenced

- **CycloneDX 1.7** — https://cyclonedx.org/docs/1.7/json/
- **NIST FIPS 203** — Module-Lattice Key-Encapsulation Mechanism (ML-KEM)
- **NIST FIPS 204** — Module-Lattice Digital Signature Algorithm (ML-DSA)
- **NIST FIPS 205** — Stateless Hash-Based Digital Signature Algorithm (SLH-DSA)
- **NIST CSOR** — Computer Security Objects Register, https://csrc.nist.gov/Projects/Computer-Security-Objects-Register

## Component Type

Every cryptographic entry uses the CycloneDX 1.7 `cryptographic-asset` component type with `cryptoProperties.assetType` of `algorithm`, `certificate`, `protocol`, or `related-crypto-material`.

## Algorithm Properties Populated

- `primitive` — `pke`, `kem`, `signature`, `hash`, `mac`, `block-cipher`, `ae`, `key-agree`.
- `parameterSetIdentifier` — for example `2048` (RSA-2048), `P-256` (ECDSA-P256), `ML-KEM-768`.
- `executionEnvironment` — `software-plain-ram`.
- `cryptoFunctions` — `sign`, `verify`, `encrypt`, `decrypt`, `keyderive`, `digest`, `tag`.
- `nistQuantumSecurityLevel` — `0` for classical; `1`–`5` for the NIST PQC categories; `6` for stronger.

## NIST Quantum Security Levels

| Level | Equivalent strength | Example |
|-------|---------------------|---------|
| 0 | None (classical) | RSA, ECDSA, AES |
| 1 | AES-128 brute-force | ML-KEM-512 |
| 3 | AES-192 brute-force | ML-KEM-768, ML-DSA-65 |
| 5 | AES-256 brute-force | ML-KEM-1024, ML-DSA-87 |

The `nginx` example includes ML-KEM-768 at level `3` as a planned-migration target via the `evidence` field.

## Validation

Every `*.cbom.json` file is validated against the CycloneDX 1.7 JSON schema bundled with `cyclonedx-python-lib`. Run `scripts/validate-all.sh` locally; CI runs the same script on every push and pull request.

## Authoring Guidance

1. Generate a unique `serialNumber` (URN UUID).
2. Set `metadata.timestamp` to the actual creation time.
3. Populate `metadata.component` with the system the CBOM is about, not the tool that generated it.
4. Use `bom-ref` consistently; refs are referenced by `cryptoRefArray`, `signatureAlgorithmRef`, etc.
5. Validate before committing; CI rejects invalid documents.

---

From Qtonic Quantum — leading quantum risk and vulnerability intelligence tools and services. Visit https://qtonicquantum.com.
