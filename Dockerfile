FROM python:3.11-alpine

WORKDIR /app

# PARCHE OS: Actualizar todos los paquetes de Alpine a su última versión segura
RUN apk update && apk upgrade --no-cache

COPY requirements.txt .

# PARCHE HERRAMIENTAS PYTHON: Actualizar pip y forzar la versión segura de setuptools
RUN pip install --upgrade pip --no-cache-dir
RUN pip install --upgrade setuptools==78.1.1 --no-cache-dir
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]