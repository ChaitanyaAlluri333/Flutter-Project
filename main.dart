
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double bmi = 0;
  String result = "";

  void calculateBMI() {
    double height = double.parse(heightController.text);
    double weight = double.parse(weightController.text);

    double heightInMeter = height / 100;

    setState(() {
      bmi = weight / (heightInMeter * heightInMeter);

      if (bmi < 18.5) {
        result = "Underweight";
      } else if (bmi < 25) {
        result = "Normal Weight";
      } else if (bmi < 30) {
        result = "Overweight";
      } else {
        result = "Obese";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calculator"),
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Column(
          children: [
            Text(
              "Body Mass Index Calculator",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 25),

            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Height (cm)",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Weight (kg)",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 25),

            ElevatedButton(
              onPressed: calculateBMI,
              child: Text("Calculate BMI"),
            ),

            SizedBox(height: 25),

            Text(
              "BMI: ${bmi.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              result,
              style: TextStyle(
                fontSize: 24,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
