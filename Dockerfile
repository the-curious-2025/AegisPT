FROM python:3.12-slim

ENV PIP_DISABLE_PIP_VERSION_CHECK=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    nmap \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY pyproject.toml ./
COPY README.md ./
COPY LICENSE ./
COPY pentest_orchestrator ./pentest_orchestrator
COPY scripts ./scripts

RUN pip install --no-cache-dir -e .

ENTRYPOINT ["aegispt"]
CMD ["--help"]
