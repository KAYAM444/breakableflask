FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r requirements.txt \
    && useradd --create-home --shell /usr/sbin/nologin appuser

COPY --chown=appuser:appuser main.py .

USER appuser

EXPOSE 4000

CMD ["python3", "main.py", "--address", "0.0.0.0", "--port", "4000"]
