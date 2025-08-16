from flask import Flask, request, render_template
import pickle
import numpy as np

app = Flask(__name__)
model = pickle.load(open('model.pkl', 'rb'))

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/predict', methods=['POST'])
def predict():
    # Get form values and convert to floats
    data = [
        float(request.form['latitude']),
        float(request.form['longitude']),
        int(request.form['hour_of_day']),
        int(request.form['day_of_week']),
        int(request.form['is_weekend']),
        int(request.form['is_night_time']),
        int(request.form['crime_count_last_hour']),
        int(request.form['crime_count_24hr']),
        float(request.form['violent_crime_ratio']),
        int(request.form['event_occurring']),
        float(request.form['avg_response_time']),
        float(request.form['police_presence_score'])
    ]

    prediction = model.predict([data])[0]
    labels = {0: "Safe", 1: "Caution", 2: "Unsafe"}
    return render_template('index.html', prediction_text=f"Risk Level: {labels[prediction]}")

if __name__ == '__main__':
    app.run(debug=True)
