import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const Color primaryBlue = Color(0xff154dc6);
// const Color lightBlue = Color(0xffe8f0fe);

class StudentExamRouteScreen extends StatelessWidget {
  const StudentExamRouteScreen({super.key});

  final List<Map<String, String>> examRoutes = const [
    {
      'subject': 'Mathematics',
      'date': '20-09-2025',
      'time': '10:00 AM - 12:00 PM',
      'exam': 'Mid Term'
    },
    {
      'subject': 'Science',
      'date': '22-09-2025',
      'time': '01:00 PM - 03:00 PM',
      'exam': 'Mid Term'
    },
    {
      'subject': 'English',
      'date': '24-09-2025',
      'time': '09:00 AM - 11:00 AM',
      'exam': 'Mid Term'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        image: "assets/images/exam_route.png",
        imageColor: AppColor.white,
        backgroundColor: AppColor.primary,
        title: "EXAM ROUTE",
        imageWidth: 40,imageHeight: 40
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome, Ajay 👋',
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.builder(
                        itemCount: examRoutes.length,
                        itemBuilder: (context, index) {
                          final exam = examRoutes[index];
                          return Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.book, color: AppColor.primary),
                                    const SizedBox(width: 10),
                                    Text(
                                      exam['subject'] ?? '',
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                _infoRow(Icons.assignment, "Exam", exam['exam']),
                                _infoRow(Icons.calendar_today, "Date", exam['date']),
                                _infoRow(Icons.access_time, "Time", exam['time']),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 8),
          Text(
            "$label: ",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
          Expanded(
            child: Text(
              value ?? '',
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
