# Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY . .

# Install curl and other dependencies
# RUN apt-get update && \
#     apt-get install -y curl && \
#     rm -rf /var/lib/apt/lists/* 
    
RUN pip install flask gunicorn

EXPOSE 8080

# Add health check with curl
# HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
#   CMD curl -f http://localhost/up || exit 1

# Use Gunicorn instead of Flask development server
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "app:app"]