FROM python:3.13.5-alpine3.22

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the folder content into workdir
COPY . .

# Exposes port 8000 to Docker, which is the FastAPI's default port.
EXPOSE 8000

CMD ["uvicorn", "app:app", "--host", "127.0.0.1", "--port", "8000", "--reload"]