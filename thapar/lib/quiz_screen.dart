import 'package:flutter/material.dart';
import 'result_screen.dart'; // Don't forget to create this file

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  final PageController _controller = PageController();
  List<int?> selectedOptions = List.filled(9, null);

  final List<String> questions = [
    "Little interest or pleasure in doing things.",
    "Feeling down, depressed, or hopeless.",
    "Trouble falling or staying asleep, or sleeping too much.",
    "Feeling tired or having little energy.",
    "Poor appetite or overeating.",
    "Feeling bad about yourself — or that you are a failure.",
    "Trouble concentrating on things.",
    "Moving or speaking so slowly or being fidgety.",
    "Thoughts that you would be better off dead.",
  ];

  final List<String> options = [
    "Not at all", // 0
    "Several days", // 1
    "More than half the days", // 2
    "Nearly every day", // 3
  ];

  Color getOptionColor(int index, int optionIndex) {
    return selectedOptions[index] == optionIndex
        ? Color(0xFF6DD47E)
        : Colors.white;
  }

  Color getOptionTextColor(int index, int optionIndex) {
    return selectedOptions[index] == optionIndex ? Colors.white : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: PageView.builder(
        controller: _controller,
        itemCount: 9,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LinearProgressIndicator(
                    value: (index + 1) / 9,
                    backgroundColor: Colors.grey[300],
                    color: Color(0xFF6DD47E),
                  ),
                  SizedBox(height: 30),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        )
                      ],
                    ),
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Question ${index + 1}/9",
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey[700])),
                        SizedBox(height: 12),
                        Text(
                          questions[index],
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF388E3C),
                          ),
                        ),
                        SizedBox(height: 24),
                        ...List.generate(options.length, (optIndex) {
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: getOptionColor(index, optIndex),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color: Color(0xFF6DD47E), width: 1),
                            ),
                            child: RadioListTile<int>(
                              activeColor: Colors.white,
                              value: optIndex,
                              groupValue: selectedOptions[index],
                              onChanged: (value) {
                                setState(() {
                                  selectedOptions[index] = value;
                                });
                              },
                              title: Text(
                                options[optIndex],
                                style: TextStyle(
                                  color: getOptionTextColor(index, optIndex),
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: index == 0
                            ? null
                            : () {
                                _controller.previousPage(
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                );
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              index == 0 ? Colors.grey[300] : Color(0xFF6DD47E),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text("Back"),
                      ),
                      ElevatedButton(
                        onPressed: selectedOptions[index] == null
                            ? null
                            : () {
                                if (index < 8) {
                                  _controller.nextPage(
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.ease,
                                  );
                                } else {
                                  // Calculate total score
                                  int totalScore = selectedOptions.fold(
                                      0, (sum, value) => sum + (value ?? 0));

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ResultScreen(score: totalScore),
                                    ),
                                  );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: selectedOptions[index] == null
                              ? Colors.grey[300]
                              : Color(0xFF6DD47E),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(index < 8 ? "Next" : "Finish"),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  buildDots(index),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildDots(int currentIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(9, (i) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: i == currentIndex ? 14 : 10,
          height: 10,
          decoration: BoxDecoration(
            color: i == currentIndex ? Color(0xFF6DD47E) : Colors.grey[300],
            borderRadius: BorderRadius.circular(5),
          ),
        );
      }),
    );
  }
}
