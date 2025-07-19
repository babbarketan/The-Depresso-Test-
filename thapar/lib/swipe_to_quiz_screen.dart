import 'package:flutter/material.dart';
import 'quote_screen.dart';
import 'quiz_screen.dart';
import 'instruction_screen.dart';

class SwipeToQuizScreen extends StatelessWidget {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      children: [
        InstructionScreen(),
        QuoteScreen(),
        QuizScreen(), // Quiz appears when user swipes left
      ],
    );
  }
}
