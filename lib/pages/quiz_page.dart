import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int index = 0;
  int score = 0;
  bool showResult = false;

  List<Map<String, dynamic>> questions = [
    {
      "question": "Quelle est la capitale du Gabon ?",
      "options": ["Libreville", "Port-Gentil", "Franceville", "Oyem"],
      "answer": "Libreville"
    },
    {
      "question": "Quel est le plus grand fleuve du Gabon ?",
      "options": ["Ogooué", "Komo", "Nyanga", "Ivindo"],
      "answer": "Ogooué"
    }
  ];

  void checkAnswer(String selected) {
    if (selected == questions[index]["answer"]) score++;

    if (index < questions.length - 1) {
      setState(() => index++);
    } else {
      setState(() => showResult = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: showResult
          ? Center(child: Text("Score : $score/${questions.length}"))
          : Column(
              children: [
                Text(questions[index]["question"]),
                ...questions[index]["options"].map<Widget>((option) => ElevatedButton(
                      onPressed: () => checkAnswer(option),
                      child: Text(option),
                    ))
              ],
            ),
    );
  }
}
