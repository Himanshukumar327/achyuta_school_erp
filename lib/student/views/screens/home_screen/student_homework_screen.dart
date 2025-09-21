import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class StudentHomeworkScreen extends StatelessWidget {
  const StudentHomeworkScreen({super.key});

  final List<Map<String, dynamic>> homeworkList = const [
    {
      "subject": "Math",
      "date": "Sep 15, 2025",
      "description": "Solve exercise 5.2 and 5.3 from NCERT.",
      "imageUrl": null,
    },
    {
      "subject": "Science",
      "date": "Sep 14, 2025",
      "description": "Read chapter on Photosynthesis and answer all questions.",
      "imageUrl": "https://images.unsplash.com/photo-1630983358494-96012d838b84?q=80&w=870&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    },
    {
      "subject": "English",
      "date": "Sep 13, 2025",
      "description": "Write an essay on 'Clean India Mission'.",
      "imageUrl": null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        backgroundColor: AppColor.primary ,
        image:"assets/images/homework.png",
        title: "HOMEWORK",
        imageColor: AppColor.white,
        imageWidth: 38,imageHeight: 38
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 12),

            /// 📋 Homework Cards
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: homeworkList.length,
                itemBuilder: (context, index) {
                  final homework = homeworkList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        )
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 🔤 Subject + Date
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              homework['subject'],
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: AppColor.primary,
                              ),
                            ),
                            Text(
                              homework['date'],
                              style: GoogleFonts.poppins(
                                fontSize: 13,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        /// 📝 Description
                        Text(
                          homework['description'],
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                          ),
                        ),

                        /// 🖼 Image Preview
                        if (homework['imageUrl'] != null) ...[
                          const SizedBox(height: 12),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              homework['imageUrl'],
                              fit: BoxFit.cover,
                              height: 180,
                              width: double.infinity,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return const Center(child: CircularProgressIndicator());
                              },
                              errorBuilder: (context, error, stackTrace) =>
                              const Text('Image failed to load'),
                            ),
                          ),

                          /// 📥 Download Button
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton.icon(
                              onPressed: () {
                                downloadAndOpenImage(context, homework['imageUrl']);
                              },
                              icon: const Icon(Icons.download, color: AppColor.primary),
                              label: Text(
                                "Download",
                                style: GoogleFonts.poppins(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ]
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 📥 Image download and open
  Future<void> downloadAndOpenImage(BuildContext context, String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      final bytes = response.bodyBytes;

      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/homework_image.jpg');
      await file.writeAsBytes(bytes);

      await OpenFile.open(file.path);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to download image: $e")),
      );
    }
  }
}
