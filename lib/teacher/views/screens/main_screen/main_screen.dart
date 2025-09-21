import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/choose_screen_top_curve_widget.dart';
import 'package:achuya_erp/teacher/views/screens/form_screen/add_account.dart';
import 'package:achuya_erp/teacher/views/screens/home_screen/exam_route/exam_route_list.dart';
import 'package:achuya_erp/teacher/views/screens/home_screen/notice_screen/notice_list_screen.dart';
import 'package:achuya_erp/teacher/views/screens/home_screen/result_screen.dart';
import 'package:achuya_erp/teacher/views/screens/home_screen/solucation_screen/solucation_list_screen.dart';
import 'package:achuya_erp/teacher/views/screens/homework_screen/homework_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:achuya_erp/teacher/views/screens/home_screen/attendance_screen.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> options = [
      {'icon': "assets/images/attendance.png", 'label': 'Attendance','screen': AttendanceScreen()},
      {'icon': "assets/images/homework.png", 'label': 'Homework','screen': HomeworkScreen()},
      {'icon': "assets/images/report.png", 'label': 'Result','screen': ResultEntryScreen()},
      {'icon': "assets/images/exam_route.png", 'label': 'Exam Route','screen': ExamRouteListScreen()},
      {'icon': "assets/images/solucation.png", 'label': 'Solucation','screen': SolutionListScreen()},
      {'icon': "assets/images/notice.png", 'label': 'Notice & Events','screen': NoticeListScreen()},
      {'icon': "assets/images/add_contact.png", 'label': 'Add Account','screen': AddAccount()},
    ];
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              ClipPath(
                clipper: TopCurveClipper(),
                child: Container(
                  height: 250,
                  color: const Color(0xFF28C2A0),
                ),
              ),
              Positioned(
                top: 120,
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF28C2A0),
                      width: 4,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColor.white,
                          radius: 60,
                          child: Center(child: Icon(CupertinoIcons.smiley,size: 123,
                            color: Color(0x90b1b1b1),)),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(13),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Welcome Message",style: GoogleFonts.poppins(fontSize: 17,
                          fontWeight: FontWeight.bold,color: AppColor.white),),
                      SizedBox(width: 10,),
                      Icon(CupertinoIcons.arrow_right,color: AppColor.white),
                    ],
                  ),
                  SizedBox(height: 7,),
                  Text("The standard Lorem Ipsum passage\nLorem ipsum dolor sit "
                      "amet, consectetur adipiscing elit, sed do\neiusmod tempor "
                      "incididunt ut labore et dolore magna aliqua. ",
                    style: GoogleFonts.poppins(color: AppColor.white,fontSize: 12),)
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: options.map((item) {
                  return buildOption(item['icon'], item['label'], item['screen']);
                }).toList(),
              ),
            ),
          ),

        ],
      ),
    );
  }
  Widget buildOption(String path, String label,Widget screen,) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> screen);
      },
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Color(0x1839ecc4),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(path),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: AppColor.black, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
