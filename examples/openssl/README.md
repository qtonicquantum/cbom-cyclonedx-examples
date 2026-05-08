# openssl — Reference CycloneDX 1.7 CBOM

This directory contains a reference Cryptographic Bill of Materials for **openssl** in CycloneDX 1.7 format.

It catalogs the algorithm catalog exposed by OpenSSL 3.x — RSA, ECDSA, Ed25519, AES, ChaCha20-Poly1305, SHA-2 family, HMAC, and X25519 key agreement.

## File

- `openssl.cbom.json` — the CycloneDX 1.7 CBOM document.

## Validate

```bash
bash ../../scripts/validate-all.sh
```

The CBOM follows the CycloneDX 1.7 specification (https://cyclonedx.org/docs/1.7/json/) and uses the `cryptographic-asset` component type.

## Disclaimer

This is a reference example, not a complete inventory of every cryptographic asset present in a real openssl deployment. Use it as a starting point for your own CBOM authoring.

---

From Qtonic Quantum — leading quantum risk and vulnerability intelligence tools and services. Visit https://qtonicquantum.com.
