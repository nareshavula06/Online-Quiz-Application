import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Quiz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

// QUESTION MODEL

class Question {
  final String question;
  final List<String> options;
  final int correctAnswer;

  const Question({
    required this.question,
    required this.options,
    required this.correctAnswer,
  });
}

// QUIZ DATA

const List<Question> questions = [
  Question(
    question: 'Which language is used to develop Flutter applications?',
    options: [
      'Java',
      'Dart',
      'Python',
      'C++',
    ],
    correctAnswer: 1,
  ),
  Question(
    question: 'Which company developed Flutter?',
    options: [
      'Microsoft',
      'Apple',
      'Google',
      'Amazon',
    ],
    correctAnswer: 2,
  ),
  Question(
    question: 'Which keyword is used to create a constant in Dart?',
    options: [
      'constant',
      'final',
      'const',
      'static',
    ],
    correctAnswer: 2,
  ),
  Question(
    question: 'Which widget is commonly used for a vertical layout?',
    options: [
      'Row',
      'Column',
      'Stack',
      'Container',
    ],
    correctAnswer: 1,
  ),
  Question(
    question: 'Which widget is used to make a scrollable list?',
    options: [
      'ListView',
      'Text',
      'Center',
      'Icon',
    ],
    correctAnswer: 0,
  ),
  Question(
    question: 'What is the default entry point of a Dart application?',
    options: [
      'start()',
      'run()',
      'main()',
      'init()',
    ],
    correctAnswer: 2,
  ),
  Question(
    question: 'Which widget is used to display text in Flutter?',
    options: [
      'Text',
      'Label',
      'String',
      'TextView',
    ],
    correctAnswer: 0,
  ),
  Question(
    question: 'Which file contains Flutter project dependencies?',
    options: [
      'main.dart',
      'pubspec.yaml',
      'index.html',
      'config.json',
    ],
    correctAnswer: 1,
  ),
  Question(
    question: 'Which widget provides a basic Material Design visual structure?',
    options: [
      'Scaffold',
      'MaterialButton',
      'Column',
      'Padding',
    ],
    correctAnswer: 0,
  ),
  Question(
    question: 'Which command runs a Flutter application?',
    options: [
      'flutter start',
      'flutter run',
      'flutter execute',
      'flutter launch',
    ],
    correctAnswer: 1,
  ),
];

// HOME SCREEN

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online Quiz'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Questions: ${questions.length}',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
