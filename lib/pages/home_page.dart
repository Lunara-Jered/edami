import 'package:flutter/material.dart';
import 'courses_page.dart';
import 'quiz_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edami - Éducation")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CoursesPage()));
              },
              child: Text("📚 Accéder aux Cours"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => QuizPage()));
              },
              child: Text("📝 Faire un Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
