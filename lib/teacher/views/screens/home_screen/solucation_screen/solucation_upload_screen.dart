import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:file_picker/file_picker.dart';

import '../../../../models/solucation_model.dart';

class SolutionUploadScreen extends StatefulWidget {
  const SolutionUploadScreen({super.key});

  @override
  State<SolutionUploadScreen> createState() => _SolutionUploadScreenState();
}

class _SolutionUploadScreenState extends State<SolutionUploadScreen> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  String? fileName;
  String? pickedFilePath;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: customAppBar(
        title: "SOLUTIONS UPLOAD",
        image: "assets/images/solucation.png",
        backgroundColor: AppColor.primary,
        imageWidth: 38,imageHeight: 38,
        imageColor: AppColor.white
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 16),

            // Enter Question
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Enter Question"),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: TextField(
                controller: questionController,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: "Type your question here...",
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Enter Details (Large)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text("Enter Details"),
            ),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: TextField(
                  controller: answerController,
                  maxLines: null,
                  minLines: 15,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
            ),

            // Upload Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff154dc6),
                  padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () async {
                  FilePickerResult? result =
                  await FilePicker.platform.pickFiles();
                  if (result != null) {
                    setState(() {
                      fileName = result.files.single.name;
                      pickedFilePath = result.files.single.path; // ✅ path save karo

                    });
                  }
                },
                child: Text(
                  fileName == null ? "Upload File" : "File: $fileName",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Send Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff154dc6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: () {
                    if (questionController.text.isNotEmpty &&
                        answerController.text.isNotEmpty) {
                      Navigator.pop(
                        context,
                        Solution(
                          question: questionController.text,
                          answer: answerController.text,
                          fileName: fileName,
                          filePath: pickedFilePath, // ✅ filePath bhi pass karo

                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Send",
                    style: TextStyle(color: Colors.white, fontSize: 16),
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
