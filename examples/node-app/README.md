# node-app — Reference CycloneDX 1.7 CBOM

This directory contains a reference Cryptographic Bill of Materials for **node-app** in CycloneDX 1.7 format.

It catalogs the cryptographic primitives exposed by Node.js node:crypto and node:tls modules used in a typical web application.

## File

- `node-app.cbom.json` — the CycloneDX 1.7 CBOM document.

## Validate

```bash
bash ../../scripts/validate-all.sh
```

The CBOM follows the CycloneDX 1.7 specification (https://cyclonedx.org/docs/1.7/json/) and uses the `cryptographic-asset` component type.

## Disclaimer

This is a reference example, not a complete inventory of every cryptographic asset present in a real node-app deployment. Use it as a starting point for your own CBOM authoring.

---

From Qtonic Quantum — leading quantum risk and vulnerability intelligence tools and services. Visit https://qtonicquantum.com.
