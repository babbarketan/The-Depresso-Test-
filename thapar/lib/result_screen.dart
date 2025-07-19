import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int score;

  ResultScreen({required this.score});

  String getResultTitle() {
    if (score <= 9) return "Minimal or No Depression";
    if (score <= 14) return "Moderate Depression";
    if (score <= 19) return "Moderately Severe Depression";
    return "Severe Depression";
  }

  String getResultDescription() {
    if (score <= 9) {
      return "Based on your responses today, you are likely experiencing minimal or no symptoms of depression. This is a good sign. Continue healthy habits and seek help if symptoms appear.";
    } else if (score <= 14) {
      return "Based on your responses today, it is possible that you could be suffering from some form of depression. You should make an appointment to see your doctor as soon as possible.";
    } else if (score <= 19) {
      return "Your score suggests moderately severe depression. Seeking help from a professional is highly recommended.";
    } else {
      return "Your responses indicate severe depression. Please seek professional help immediately. You are not alone, and support is available.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF6DD47E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Your Results",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                "$score / 27",
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                getResultTitle(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: 20),
              LinearProgressIndicator(
                value: score / 27,
                backgroundColor: Colors.white24,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              SizedBox(height: 30),
              Text(
                getResultDescription(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Back to home or quiz
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF6DD47E),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Back to Home"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
