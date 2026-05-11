.PHONY: install deps run-web run-net report clean docker-build docker-run

TARGET ?= 127.0.0.1
SESSION ?=

install:
	python3 -m venv .venv
	. .venv/bin/activate; pip install -e .

deps:
	chmod +x scripts/install_kali_deps.sh
	./scripts/install_kali_deps.sh

run-web:
	. .venv/bin/activate; aegispt run --target $(TARGET) --authorized --profile web

run-net:
	. .venv/bin/activate; aegispt run --target $(TARGET) --authorized --profile network

report:
	. .venv/bin/activate; aegispt report --session-id $(SESSION)

clean:
	rm -rf .venv
	find . -type d -name __pycache__ -prune -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

docker-build:
	docker build -t aegispt:latest .

docker-run:
	docker run --rm -it aegispt:latest aegispt run --target $(TARGET) --authorized --profile web
