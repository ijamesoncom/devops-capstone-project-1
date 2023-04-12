FROM python:3.9-slim

# Create working folder and install dependencies
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копирует содержимое каталога service/ из текущего каталога внутрь контейнера в /app/service/
COPY service/ ./service/

# Создает нового пользователя с идентификатором 1000, называется "theia", и устанавливает его владельцем всей директории /app.
RUN useradd --uid 1000 theia && chown -R theia /app
USER theia

# Run the service
EXPOSE 8080
CMD ["gunicorn", "--bind=0.0.0.0:8080", "--log-level=info", "service:app"]