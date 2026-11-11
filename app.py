import os
from flask import Flask

app = Flask(__name__)

# Lectura limpia de variables de entorno sin valores por defecto estáticos
aws_key = os.environ.get("AWS_SECRET_KEY")
db_pass = os.environ.get("DB_PASSWORD")

@app.route("/")
def hello():
    return "¡API DevSecOps desplegada y segura!"

if __name__ == "__main__":
    # Bindeo a localhost para cumplir con las políticas de Bandit (B104)
    app.run(host="127.0.0.1", port=5000, debug=False)