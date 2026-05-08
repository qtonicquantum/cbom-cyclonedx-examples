# cbom-cyclonedx-examples
default: validate

validate:
    bash scripts/validate-all.sh

test: validate

clean:
    find . -name __pycache__ -type d -exec rm -rf {} + 2>/dev/null || true
    rm -rf .pytest_cache .mypy_cache build dist *.egg-info
