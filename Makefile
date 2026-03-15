.PHONY: setup

VENV=.venv
PYTHON=$(VENV)/bin/python
PIP=$(VENV)/bin/pip

# Install development tools
setup:
	@if [ ! -d "$(VENV)" ]; then \
		echo "Creating virtual environment..."; \
		python3 -m venv $(VENV); \
	fi
	@echo "Installing Python dependencies..."
	@$(PIP) install --upgrade pip
	@$(PIP) install -r dev-requirements.txt

# Build project
build:
	cargo build

# Run CLI
run:
	cargo run -p dag_gen_cli

# Run tests
test:
	cargo test

# Format code
fmt:
	cargo fmt

# Lint code
lint:
	cargo clippy

# Full dev check
check: fmt lint test