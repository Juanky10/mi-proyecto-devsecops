import os
from flask import Flask

app = Flask(__name__)

# Usar variables de entorno en lugar de credenciales en el código
AWS_SECRET_KEY = os.environ.get("AWS_SECRET_KEY", "default_secret")
DB_PASSWORD = os.environ.get("DB_PASSWORD", "default_pass")

@app.route("/")
def hello():
    return "¡API DevSecOps desplegada y segura!"

if __name__ == "__main__":
    # Desactivar debug para producción
    app.run(host="0.0.0.0", port=5000, debug=False)