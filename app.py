from flask import Flask

app = Flask(__name__)

# 🚨 VULNERABILIDAD 1: Secreto "hardcodeado" (Bandit lo detectará)
AWS_SECRET_KEY = "AKIAIOSFODNN7EXAMPLE"
DB_PASSWORD = "super_secret_password_123"

@app.route("/")
def hello():
    return "¡API DevSecOps desplegada correctamente!"

if __name__ == "__main__":
    # 🚨 VULNERABILIDAD 2: Ejecutar Flask en modo debug en producción
    app.run(host="0.0.0.0", port=5000, debug=True)