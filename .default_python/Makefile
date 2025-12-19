.PHONY: help all venv install clean

PYTHON := python
VENV_DIR := .venv
VENV_PIP := $(VENV_DIR)/bin/pip

IN_VENV := $(shell python -c 'import sys; print(int(sys.prefix != sys.base_prefix))')

help:
	@echo "Available targets:"
	@echo "  make all                    - Create venv and install dependencies"
	@echo "  make venv                   - Create a virtual environment in .venv/"
	@echo "  make install                - Install the project dependencies"
	@echo "  make clean                  - Remove build artifacts and venv"

all: venv install

venv:
	@if [ -d "$(VENV_DIR)" ]; then \
		echo "Virtual environment already exists at $(VENV_DIR)"; \
	else \
		echo "Creating virtual environment..."; \
		$(PYTHON) -m venv $(VENV_DIR); \
		echo "Virtual environment created at $(VENV_DIR)"; \
		echo "Activate it with: source $(VENV_DIR)/bin/activate"; \
	fi

install:
	@if [ -d "$(VENV_DIR)" ] && [ "$(IN_VENV)" = "0" ]; then \
		echo "Virtual environment detected but not activated."; \
		echo "Installing dependencies in venv..."; \
		$(VENV_PIP) install --upgrade pip; \
		$(VENV_PIP) install -r requirements.txt; \
	elif [ "$(IN_VENV)" = "1" ]; then \
		echo "Installing dependencies in active virtual environment..."; \
		pip install --upgrade pip; \
		pip install -r requirements.txt; \
	else \
		echo "No virtual environment detected."; \
		echo "Installing dependencies in system/user Python..."; \
		pip install --upgrade pip; \
		pip install -r requirements.txt; \
	fi
	@echo "Dependencies installed!"

clean:
	@echo "Cleaning build artifacts..."
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	rm -rf $(VENV_DIR)
	find . -type d -name __pycache__ -exec rm -rf {} + 2>/dev/null || true
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.so" -delete
	@echo "Clean complete!"
