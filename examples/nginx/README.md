# nginx — Reference CycloneDX 1.7 CBOM

This directory contains a reference Cryptographic Bill of Materials for **nginx** in CycloneDX 1.7 format.

It catalogs TLS 1.2 and TLS 1.3 protocol entries, the RSA-2048 and ECDSA-P256 server keys, the AES-256-GCM and SHA-256/SHA-384 primitives, and includes ML-KEM-768 as a planned post-quantum migration target via the `evidence` field.

## File

- `nginx.cbom.json` — the CycloneDX 1.7 CBOM document.

## Validate

```bash
bash ../../scripts/validate-all.sh
```

The CBOM follows the CycloneDX 1.7 specification (https://cyclonedx.org/docs/1.7/json/) and uses the `cryptographic-asset` component type.

## Disclaimer

This is a reference example, not a complete inventory of every cryptographic asset present in a real nginx deployment. Use it as a starting point for your own CBOM authoring.

---

From Qtonic Quantum — leading quantum risk and vulnerability intelligence tools and services. Visit https://qtonicquantum.com.
