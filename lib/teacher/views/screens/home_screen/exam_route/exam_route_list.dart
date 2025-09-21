import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'exam_route_screen.dart';

const Color primaryBlue = AppColor.primary;
const Color secondaryBlue = Color(0xff467dfc);

class ExamRoute {
  final String className;
  final String section;
  final String examName;
  final String date;
  final String startTime;
  final String endTime;

  ExamRoute({
    required this.className,
    required this.section,
    required this.examName,
    required this.date,
    required this.startTime,
    required this.endTime,
  });
}

class ExamRouteListScreen extends StatelessWidget {
  final List<ExamRoute> examRoutes = [
    ExamRoute(
      className: '1',
      section: 'A',
      examName: 'Unit Test 1',
      date: '15-09-2025',
      startTime: '10:00 AM',
      endTime: '11:30 AM',
    ),
    ExamRoute(
      className: '2',
      section: 'B',
      examName: 'Mid Term',
      date: '18-09-2025',
      startTime: '12:00 PM',
      endTime: '02:00 PM',
    ),
    ExamRoute(
      className: '3',
      section: 'C',
      examName: 'Final Exam',
      date: '25-09-2025',
      startTime: '09:00 AM',
      endTime: '12:00 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: customAppBar(
        title: "EXAM ROUTE",
        image: "assets/images/exam_route.png",
        imageColor: AppColor.white,imageHeight: 38,
        imageWidth: 38,backgroundColor: AppColor.primary
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: examRoutes.length,
                itemBuilder: (context, index) {
                  final route = examRoutes[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColor.white, Color(0xffeef3ff)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.08),
                          blurRadius: 8,
                          offset: const Offset(2, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Exam Name Header
                          Container(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [primaryBlue, secondaryBlue],
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              route.examName,
                              style: GoogleFonts.poppins(
                                  color: AppColor.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 14),

                          // Class & Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _infoBox(Icons.class_, "Class", route.className),
                              _infoBox(Icons.people, "Section", route.section),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Date & Time
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _infoBox(Icons.calendar_today, "Date", route.date),
                              _infoBox(Icons.access_time, "Time",
                                  "${route.startTime} - ${route.endTime}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue ,
        elevation: 10 ,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30,),borderSide: BorderSide.none
        ),
        onPressed: (){
          Get.to(()=> ExamRouteScreen());
        },
        child: CircleAvatar(
          backgroundColor:primaryBlue ,
          child: Icon(Icons.add,color: AppColor.white,),
        ),
      ),
    );
  }

  /// Info Box Widget (Rounded background with icon + label + value)
  Widget _infoBox(IconData icon, String label, String value) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade200),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: primaryBlue),
            const SizedBox(width: 8),
            Expanded( // ✅ Yeh important hai
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54),
                  ),
                  Text(
                    value,
                    style: GoogleFonts.poppins(
                        fontSize: 14, fontWeight: FontWeight.w600),
                    softWrap: true,          // ✅ wrapping allow
                    overflow: TextOverflow.visible, // ✅ pura dikhayega
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
