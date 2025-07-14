FROM ghcr.io/hacktricks-wiki/hacktricks-cloud/translator-image:latest

COPY hacktricks/ /app/
COPY book.toml /app/book.toml

CMD ["bash", "-c", "cd /app && MDBOOK_PREPROCESSOR__HACKTRICKS__ENV=dev mdbook serve --hostname 0.0.0.0"]