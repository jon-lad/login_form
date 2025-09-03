FROM python:3.11-alpine

RUN adduser -D appuser

WORKDIR /app
COPY . .

# Install build dependencies (needed for seleniumbase & faker sometimes)
RUN apk add --no-cache gcc musl-dev libffi-dev

# Install your app (Flask comes via setup.py)
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -e .

RUN chmod +x scripts/*
RUN chown -R appuser:appuser /app

USER appuser

ENV FLASK_APP=login_form \
    PATH="/usr/local/bin:$PATH"

EXPOSE 5000

CMD ["./scripts/entrypoint.sh"]
