
import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';

import 'notice_upload_screen.dart';

class NoticeListScreen extends StatefulWidget {
  const NoticeListScreen({super.key});

  @override
  State<NoticeListScreen> createState() => _NoticeListScreenState();
}

class _NoticeListScreenState extends State<NoticeListScreen> {
  final List<Map<String, String?>> notices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        image: "assets/images/notice.png",
        title: "ALL NOTICES",
        backgroundColor: AppColor.primary,
        imageColor: AppColor.white,
        imageHeight: 38,imageWidth: 38
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: notices.isEmpty
                  ? Center(
                child: Text(
                  "No notices yet",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
                  : ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                itemCount: notices.length,
                separatorBuilder: (_, __) => const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final item = notices[index];
                  final imagePath = item["image"];

                  return Material(
                    elevation: 3,
                    borderRadius: BorderRadius.circular(14),
                    shadowColor: Colors.black26,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () {
                        // You could open the notice details screen here if you want
                      },
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["details"] ?? "No details",
                              style: GoogleFonts.poppins(
                                fontSize: 17,
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                                height: 1.3,
                              ),
                            ),
                            if (imagePath != null) ...[
                              const SizedBox(height: 14),
                              GestureDetector(
                                onTap: () async {
                                  await OpenFile.open(imagePath);
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffe1eaff),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.blue.withOpacity(0.15),
                                        blurRadius: 6,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(Icons.insert_drive_file, color: Color(0xff154dc6)),
                                      const SizedBox(width: 10),
                                      Flexible(
                                        child: Text(
                                          imagePath.split('/').last,
                                          style: GoogleFonts.poppins(
                                            color: const Color(0xff154dc6),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      const SizedBox(width: 6),
                                      const Icon(Icons.open_in_new, color: Color(0xff154dc6), size: 18),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xff154dc6),
        onPressed: () async {
          final newNotice = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const NoticeFormScreen(),
            ),
          );

          if (newNotice != null && newNotice is Map<String, String?>) {
            setState(() {
              notices.add(newNotice);
            });
          }
        },
        icon: const Icon(Icons.add,color: Colors.white,),
        label: Text(
          "Add Notice",
          style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
    );
  }
}
