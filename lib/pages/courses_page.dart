import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'video_player_widget.dart';

class CoursesPage extends StatefulWidget {
  @override
  _CoursesPageState createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final List<Map<String, String>> courses = [
    {"title": "Histoire du Gabon", "type": "pdf", "path": "assets/pdfs/histoire.pdf"},
    {"title": "Géographie du Gabon", "type": "pdf", "path": "assets/pdfs/geographie.pdf"},
    {"title": "Éducation Environnementale", "type": "video", "path": "assets/videos/environnement.mp4"},
    {"title": "Faune et Flore du Gabon", "type": "video", "path": "assets/videos/faune_flore.mp4"},
  ];

  List<Map<String, String>> filteredCourses = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredCourses = courses;
  }

  void filterSearch(String query) {
    setState(() {
      filteredCourses = courses
          .where((course) => course["title"]!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("📚 Cours"),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              width: 200,
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Rechercher...",
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: filterSearch,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: filteredCourses.length,
          itemBuilder: (context, index) {
            var course = filteredCourses[index];
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(10),
                title: Text(
                  course["title"]!,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(
                  course["type"] == "pdf" ? Icons.picture_as_pdf : Icons.video_library,
                  color: course["type"] == "pdf" ? Colors.red : Colors.blue,
                ),
                trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                onTap: () {
                  if (course["type"] == "pdf") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PdfViewerPage(pdfPath: course["path"]!),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerWidget(videoPath: course["path"]!),
                      ),
                    );
                  }
                },
              ),
            );
          },
        ),
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
      body: Center(
        child: PDFView(
          filePath: pdfPath,
          enableSwipe: true,
          swipeHorizontal: true,
          autoSpacing: false,
          pageFling: true,
          onRender: (pages) {
            print("PDF rendu avec $pages pages");
          },
          onError: (error) {
            print("Erreur d'affichage du PDF: $error");
          },
        ),
      ),
    );
  }
}
