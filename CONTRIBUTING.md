# Contributing

Thank you for considering a contribution to `cbom-cyclonedx-examples`. This
repository is a reference set of CycloneDX 1.7 Cryptographic Bills of
Materials for common stacks. Contributions that add additional reference
stacks, correct cryptographic claims, or improve schema conformance are
especially welcome.

## Ground Rules

  1. **CycloneDX 1.7 only.** Every `*.cbom.json` file must declare
     `"specVersion": "1.7"` and validate against the official CycloneDX 1.7
     JSON schema.
  2. **No trade secrets.** Do not include scoring weights, proprietary
     methodologies, or non-public detection logic.
  3. **No customer names.** Reference materials must be vendor- and
     customer-neutral.
  4. **Capability claims only.** Do not include cost, time, or effort
     estimates.

## Development Loop

```bash
git clone https://github.com/qtonicquantum/cbom-cyclonedx-examples.git
cd cbom-cyclonedx-examples
just validate           # validates every examples/**/*.cbom.json
```

If you do not have `just` installed, run `bash scripts/validate-all.sh`.

## Adding a New Stack

  1. Create `examples/<stack-name>/`.
  2. Add `<stack-name>.cbom.json` (CycloneDX 1.7).
  3. Add a `README.md` that explains what the example demonstrates.
  4. Run `just validate` and confirm it passes locally.
  5. Add a row to the examples table in the top-level `README.md`.
  6. Open a pull request using the supplied template.

## Code of Conduct

This project follows the Contributor Covenant 2.1. By participating, you
agree to abide by its terms. See `CODE_OF_CONDUCT.md`.

## License

  * Code (scripts, workflows): MIT — see `LICENSE`.
  * Content (CBOMs, documentation): CC-BY-4.0 — see `LICENSE-CONTENT`.

By submitting a contribution you agree to license it under the same terms.

---

From Qtonic Quantum — leading quantum risk and vulnerability intelligence tools and services. Visit https://qtonicquantum.com.
