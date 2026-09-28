```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const FlutterQuizApp());
}

class FlutterQuizApp extends StatelessWidget {
  const FlutterQuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Quiz',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFFF5F3FF),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// --------------------------------------------------
// QUESTION MODEL
// --------------------------------------------------

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

// --------------------------------------------------
// QUESTIONS
// --------------------------------------------------

final List<Question> questions = [
  const Question(
    question: 'What language is used to write Flutter applications?',
    options: [
      'Java',
      'Dart',
      'Python',
      'C++',
    ],
    correctAnswer: 1,
  ),

  const Question(
    question: 'Which company developed Flutter?',
    options: [
      'Microsoft',
      'Apple',
      'Google',
      'Meta',
    ],
    correctAnswer: 2,
  ),

  const Question(
    question: 'Which function is the entry point of a Dart program?',
    options: [
      'start()',
      'run()',
      'main()',
      'begin()',
    ],
    correctAnswer: 2,
  ),

  const Question(
    question: 'Which widget is commonly used to display text in Flutter?',
    options: [
      'Text',
      'Label',
      'String',
      'TextView',
    ],
    correctAnswer: 0,
  ),

  const Question(
    question: 'Which widget is used to create a vertical layout?',
    options: [
      'Row',
      'Column',
      'Stack',
      'Container',
    ],
    correctAnswer: 1,
  ),

  const Question(
    question: 'Which widget is used to create a horizontal layout?',
    options: [
      'Column',
      'Stack',
      'Row',
      'Center',
    ],
    correctAnswer: 2,
  ),

  const Question(
    question: 'Which widget provides the basic Material Design page structure?',
    options: [
      'Scaffold',
      'Container',
      'MaterialPage',
      'Screen',
    ],
    correctAnswer: 0,
  ),

  const Question(
    question: 'Which keyword is used for an immutable widget constructor?',
    options: [
      'static',
      'final',
      'const',
      'fixed',
    ],
    correctAnswer: 2,
  ),

  const Question(
    question: 'Which widget is used to make a button in Flutter?',
    options: [
      'ButtonWidget',
      'ElevatedButton',
      'ClickButton',
      'ActionButton',
    ],
    correctAnswer: 1,
  ),

  const Question(
    question: 'Which file contains the main Dart code of a basic Flutter app?',
    options: [
      'index.html',
      'main.dart',
      'app.js',
      'flutter.dart',
    ],
    correctAnswer: 1,
  ),
];

// --------------------------------------------------
// HOME SCREEN
// --------------------------------------------------

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.flutter_dash,
                size: 120,
                color: Colors.blue,
              ),

              const SizedBox(height: 25),

              const Text(
                'Flutter Quiz',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                'Test your Flutter knowledge!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 15),

              const Text(
                '10 Questions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 40),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const QuizScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'START QUIZ',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --------------------------------------------------
// QUIZ SCREEN
// --------------------------------------------------

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestion = 0;
  int score = 0;
  int? selectedAnswer;

  void selectAnswer(int index) {
    setState(() {
      selectedAnswer = index;
    });
  }

  void nextQuestion() {
    if (selectedAnswer == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select an answer'),
        ),
      );
      return;
    }

    if (selectedAnswer == questions[currentQuestion].correctAnswer) {
      score++;
    }

    if (currentQuestion == questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultScreen(
            score: score,
            total: questions.length,
          ),
        ),
      );
    } else {
      setState(() {
        currentQuestion++;
        selectedAnswer = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentQuestion];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Quiz'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Question ${currentQuestion + 1} of ${questions.length}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),

            const SizedBox(height: 12),

            LinearProgressIndicator(
              value: (currentQuestion + 1) / questions.length,
              minHeight: 8,
              backgroundColor: Colors.grey.shade300,
              color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(10),
            ),

            const SizedBox(height: 35),

            Text(
              question.question,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  final isSelected = selectedAnswer == index;

                  return GestureDetector(
                    onTap: () {
                      selectAnswer(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.deepPurple
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? Colors.deepPurple
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: isSelected
                                ? Colors.white
                                : Colors.deepPurple,
                            child: Text(
                              String.fromCharCode(65 + index),
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.deepPurple
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Text(
                              question.options[index],
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  currentQuestion == questions.length - 1
                      ? 'FINISH QUIZ'
                      : 'NEXT QUESTION',
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --------------------------------------------------
// RESULT SCREEN
// --------------------------------------------------

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
  });

  String getMessage() {
    final percentage = (score / total) * 100;

    if (percentage >= 80) {
      return 'Excellent! 🎉';
    } else if (percentage >= 60) {
      return 'Good Job! 👍';
    } else if (percentage >= 40) {
      return 'Keep Practicing! 📚';
    } else {
      return 'Try Again! 💪';
    }
  }

  @override
  Widget build(BuildContext context) {
    final percentage = ((score / total) * 100).round();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Result'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.emoji_events,
                size: 110,
                color: Colors.amber,
              ),

              const SizedBox(height: 20),

              const Text(
                'Quiz Completed!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              Text(
                getMessage(),
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple,
                ),
              ),

              const SizedBox(height: 30),

              Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    children: [
                      const Text(
                        'Your Score',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        '$score / $total',
                        style: const TextStyle(
                          fontSize: 45,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        '$percentage%',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'PLAY AGAIN',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
