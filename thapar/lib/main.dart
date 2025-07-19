import 'package:flutter/material.dart';
import 'package:thapar/home_screen.dart';
import 'package:thapar/quote_screen.dart';
import 'package:thapar/instruction_screen.dart';
import 'package:thapar/swipe_to_quiz_screen.dart';

void main() => runApp(PHQ9App());

class PHQ9App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PHQ-9 App',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Color(0xFF6DD47E),
        fontFamily: 'Arial',
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/quote': (context) => SwipeToQuizScreen(),
        '/start': (context) => QuoteScreen(),
        '/quote1': (context) => InstructionScreen(),
      },
    );
  }
}
