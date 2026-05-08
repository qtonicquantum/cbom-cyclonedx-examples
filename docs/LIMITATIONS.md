# Limitations

These reference CBOMs are authoring starting points, not authoritative inventories.

## What these examples are

- Schema-valid CycloneDX 1.7 documents demonstrating the `cryptographic-asset` component type.
- Representative inventories of cryptographic primitives, protocols, and certificates a typical instance of each subject system would expose.
- A teaching reference for CBOM structure, `bom-ref` patterns, and PQC migration-target representation.

## What these examples are NOT

- **Not complete inventories.** Real production systems contain additional cryptographic surface (third-party plugins, dynamic libraries, kernel-level primitives, hardware tokens) not represented here.
- **Not authoritative versions.** Component versions shown are illustrative; real CBOMs should reflect actual deployed versions.
- **Not authoritative OIDs for all parameter sets.** PQC OIDs in particular are tracked in the NIST CSOR (https://csrc.nist.gov/Projects/Computer-Security-Objects-Register); values here are accurate as of authoring but may evolve.
- **Not a replacement for a live CBOM generator.** Use cyclonedx-python-lib (https://github.com/CycloneDX/cyclonedx-python-lib) or cyclonedx-cli (https://github.com/CycloneDX/cyclonedx-cli) to generate CBOMs from your real systems.
- **Not a vulnerability assessment.** A CBOM lists what is present; it does not assess exposure, exploitability, or migration urgency.

## For comprehensive cryptographic risk assessment

Refer to https://qtonicquantum.com for QScout cryptographic assessment, QStrike governed follow-on validation, and QSolve PQC migration services.

---

From Qtonic Quantum — leading quantum risk and vulnerability intelligence tools and services. Visit https://qtonicquantum.com.
