# Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY . .
RUN pip install flask gunicorn
EXPOSE 8080

# Add health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/up || exit 1

# Use Gunicorn instead of Flask development server
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]