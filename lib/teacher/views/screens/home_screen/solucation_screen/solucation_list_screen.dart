import 'dart:io';

import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:achuya_erp/teacher/views/screens/home_screen/solucation_screen/solucation_upload_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';
import '../../../../models/solucation_model.dart';

class SolutionListScreen extends StatefulWidget {
  const SolutionListScreen({super.key});

  @override
  State<SolutionListScreen> createState() => _SolutionListScreenState();
}

class _SolutionListScreenState extends State<SolutionListScreen> {
  final List<Solution> _solutions = [];

  void _addSolution(Solution solution) {
    setState(() {
      _solutions.add(solution);
    });
  }

  void _openFile(String filePath) {
    OpenFile.open(filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        image: "assets/images/solucation.png",
        title: "SOLUTIONS",imageColor: AppColor.white,
        imageHeight: 38,imageWidth: 38,
        backgroundColor: AppColor.primary
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _solutions.isEmpty
                  ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 12),
                    Text(
                      "No solutions uploaded yet",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              )
              : ListView.builder(
                padding: const EdgeInsets.all(14),
                itemCount: _solutions.length,
                itemBuilder: (context, index) {
                  final solution = _solutions[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(14),
                      title: Text(
                        solution.question,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 6),
                          Text(
                            solution.answer,
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          if (solution.filePath != null) ...[
                            const SizedBox(height: 12),
                            GestureDetector(
                              onTap: () => _openFile(solution.filePath!),
                              child: solution.filePath!.endsWith(".png") ||
                                  solution.filePath!.endsWith(".jpg") ||
                                  solution.filePath!.endsWith(".jpeg")
                                  ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  File(solution.filePath!),
                                  width: double.infinity,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              )
                                  : Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                decoration: BoxDecoration(
                                  color: const Color(0xffeaf2ff),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(Icons.insert_drive_file,
                                        color: AppColor.primary),
                                    const SizedBox(width: 8),
                                    Flexible(
                                      child: Text(
                                        solution.fileName ?? "Open File",
                                        style: GoogleFonts.poppins(
                                          color: AppColor.primary,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              )
            ),
          ],
        ),
      ),

      /// 🔹 Floating Button
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColor.primary,
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const SolutionUploadScreen(),
            ),
          );

          if (result != null && result is Solution) {
            _addSolution(result);
          }
        },
        icon: const Icon(Icons.add, color: AppColor.white),
        label: Text("Add Solution",style: GoogleFonts.poppins(color: AppColor.white),),
      ),
    );
  }
}
