# Security Policy

## Reporting a Vulnerability

If you discover a security issue in this repository — whether in the example
CBOMs, the validation tooling, or any documentation that could mislead a
consumer about cryptographic posture — please report it privately.

**Email:** ciso@qtonicquantum.com

Please include:

  * A clear description of the issue and which file(s) are affected.
  * Steps to reproduce, if applicable.
  * The CycloneDX specification version you were validating against.
  * Whether you would like to be credited in the changelog.

We will acknowledge receipt within five business days and provide a remediation
timeline once we have triaged the report.

## Scope

This repository contains reference CycloneDX 1.7 Cryptographic Bills of
Materials. It does not handle production cryptographic material, customer
data, or runtime secrets. Reports about the example content (for instance, an
incorrect algorithm parameter set, an invalid OID, or a non-conformant schema
field) are explicitly in scope and welcome.

## Out of Scope

  * Issues against unsupported CycloneDX specification versions (this
    repository targets 1.7 only).
  * Bug reports for the upstream `cyclonedx-python-lib` project (please
    file those at https://github.com/CycloneDX/cyclonedx-python-lib).

---

From Qtonic Quantum — leading quantum risk and vulnerability intelligence tools and services. Visit https://qtonicquantum.com.
