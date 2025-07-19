import 'package:flutter/material.dart';

class InstructionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient background
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6DD47E), Color(0xFF42A17C)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Container(
                    padding: EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 6),
                        )
                      ],
                    ),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontFamily: 'Arial',
                          height: 1.4,
                        ),
                        children: [
                          TextSpan(text: "Over the last\n\n"),
                          TextSpan(
                            text: "2 weeks",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                          TextSpan(text: ",\n"),
                          TextSpan(
                            text:
                                "how often have you been bothered by any of the following problems?",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom swipe info (left corner)
              Positioned(
                bottom: 30,
                left: 20,
                child: Row(
                  children: [
                    Icon(Icons.swipe_left, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "Swipe to Start",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    )
                  ],
                ),
              ),

              // Swipe animation icons (right corner)
              Positioned(
                bottom: 30,
                right: 20,
                child: Row(
                  children: [
                    Icon(Icons.touch_app, color: Colors.white),
                    SizedBox(width: 6),
                    Icon(Icons.keyboard_double_arrow_right,
                        color: Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
