import 'dart:io';
import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class NoticeFormScreen extends StatefulWidget {
  const NoticeFormScreen({super.key});

  @override
  State<NoticeFormScreen> createState() => _NoticeFormScreenState();
}

class _NoticeFormScreenState extends State<NoticeFormScreen> {
  final TextEditingController detailsController = TextEditingController();
  File? uploadedImage;
  String? fileName;
  String? pickedFilePath;

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery); // ya ImageSource.camera

    if (pickedFile != null) {
      setState(() {
        uploadedImage = File(pickedFile.path); // ✅ preview ke liye
        fileName = pickedFile.name;            // ✅ file ka naam
        pickedFilePath = pickedFile.path;      // ✅ backend ke liye path
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: customAppBar(
        image: "assets/images/notice.png",
        title: "NOTICE AND EVENTS",
        imageWidth: 38,imageHeight: 38,
        imageColor: AppColor.white,
        backgroundColor: AppColor.primary
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 20),

            // ✅ Form Body
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Enter Details"),
                  const SizedBox(height: 6),
                  TextField(
                    controller: detailsController,
                    maxLines: 6,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // ✅ Upload Button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff154dc6),
                    ),
                    onPressed: pickImage,
                    child: Text("Upload Image",style: GoogleFonts.poppins(color: Colors.white),),
                  ),

                  // ✅ File name show
                  if (fileName != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      "Selected: $fileName",
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],

                  // ✅ Image Preview
                  if (uploadedImage != null) ...[
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        uploadedImage!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            const Spacer(),

            // ✅ Submit Button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff154dc6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                ),
                onPressed: () {
                  Navigator.pop(context, {
                    "details": detailsController.text,
                    "image": pickedFilePath, // ✅ backend ke liye image path
                  });
                },
                child: const Text(
                  "Send",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
