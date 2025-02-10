import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(EdamiApp());
}

class EdamiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edami',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
