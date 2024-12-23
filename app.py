from flask import Flask, request, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return "Welcome to the Sum Calculator API!"

@app.route("/sum", methods=["POST"])
def calculate_sum():
    # Get JSON input from the user
    data = request.get_json()
    
    if not data or "num1" not in data or "num2" not in data:
        return jsonify({"error": "Please provide 'num1' and 'num2' in the request body"}), 400
    
    try:
        # Parse the numbers
        num1 = float(data["num1"])
        num2 = float(data["num2"])
    except ValueError:
        return jsonify({"error": "Invalid numbers provided"}), 400
    
    # Calculate the sum
    result = num1 + num2
    
    return jsonify({"num1": num1, "num2": num2, "sum": result})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
