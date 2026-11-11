FROM python:3.11-alpine

WORKDIR /app

COPY requirements.txt .
# Alpine requiere a veces herramientas extra de compilación, pero para Flask esto bastará
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]