import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import '../video_player_widget.dart';

class CoursesPage extends StatelessWidget {
  final List<Map<String, String>> courses = [
    {"title": "Histoire du Gabon", "type": "pdf", "path": "assets/pdfs/histoire.pdf"},
    {"title": "Géographie du Gabon", "type": "pdf", "path": "assets/pdfs/geographie.pdf"},
    {"title": "Éducation Environnementale", "type": "video", "path": "assets/videos/environnement.mp4"},
    {"title": "Faune et Flore du Gabon", "type": "video", "path": "assets/videos/faune_flore.mp4"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cours")),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          var course = courses[index];
          return ListTile(
            title: Text(course["title"]!),
            leading: Icon(course["type"] == "pdf" ? Icons.picture_as_pdf : Icons.video_library),
            onTap: () {
              if (course["type"] == "pdf") {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PdfViewerPage(pdfPath: course["path"]!)));
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => VideoPlayerWidget(videoPath: course["path"]!)));
              }
            },
          );
        },
      ),
    );
  }
}

class PdfViewerPage extends StatelessWidget {
  final String pdfPath;

  PdfViewerPage({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("📖 Lecture PDF")),
      body: PDFView(
        filePath: pdfPath,
      ),
    );
  }
}
