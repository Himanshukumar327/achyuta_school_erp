import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/screens/auth/choose_role_screen.dart';
import 'package:achuya_erp/student/views/screens/drawer_screen/emergency_contacts.dart';
import 'package:achuya_erp/student/views/screens/drawer_screen/profile_of_publication.dart';
import 'package:achuya_erp/student/views/screens/drawer_screen/profile_of_school.dart';
import 'package:achuya_erp/student/views/screens/home_screen/profile_screen.dart';
import 'package:achuya_erp/student/views/screens/home_screen/quiz_screen/quiz_list_screen.dart';
import 'package:achuya_erp/student/views/screens/home_screen/student_attendance_screen.dart';
import 'package:achuya_erp/student/views/screens/home_screen/student_exam_route_screen.dart';
import 'package:achuya_erp/student/views/screens/home_screen/student_homework_screen.dart';
import 'package:achuya_erp/student/views/screens/home_screen/student_result_screen.dart';
import 'package:achuya_erp/student/views/screens/home_screen/student_solucation/student_solucation_screen.dart';
import 'package:achuya_erp/student/views/widgets/choose_screen_top_curve_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> options = [
      {'icon': "assets/images/attendance.png", 'label': 'Attendance','screen': StudentAttendanceScreen()},
      {'icon': "assets/images/homework.png", 'label': 'Homework','screen': StudentHomeworkScreen()},
      {'icon': "assets/images/report.png", 'label': 'Result','screen': StudentResultScreen()},
      {'icon': "assets/images/exam_route.png", 'label': 'Exam Route','screen': StudentExamRouteScreen()},
      {'icon': "assets/images/solucation.png", 'label': 'Solucation','screen': StudentSolutionListScreen()},
      {'icon': "assets/images/notice.png", 'label': 'Quiz','screen': QuizListScreen()},
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        backgroundColor: AppColor.primary,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFC4C4C4),
              ),
              child: Text(
                '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Image.asset("assets/images/drawer_school_img.png",height: 30,width: 30,),
              title: Text('Profile of School',style: GoogleFonts.poppins(color: AppColor.white),),
              onTap: () {Get.to(()=> SchoolProfileScreen());},
            ),
            ListTile(
              leading: Image.asset("assets/images/drawer_profile_img.png",height: 30,width: 30,),
              title: Text('Profile of publication',style: GoogleFonts.poppins(color: AppColor.white),),
              onTap: () {Get.to(()=> PublicationProfileScreen());},
            ),
            ListTile(
              leading: Image.asset("assets/images/drawer_emergency_img.png",height: 30,width: 30,),
              title: Text('Emergency contacts',style: GoogleFonts.poppins(color: AppColor.white),),
              onTap: () {Get.to(()=> EmergencyContactScreen());},
            ), ListTile(
              leading: Image.asset("assets/images/drawer_setting_img.png",height: 30,width: 30,),
              title: Text('Setting',style: GoogleFonts.poppins(color: AppColor.white),),
              onTap: () {Get.to(()=> ProfileScreen());},
            ),
            ListTile(
              leading: Icon(Icons.logout,color: AppColor.white,),
              title: Text('Logout',style: GoogleFonts.poppins(color: AppColor.white),),
              onTap: () {
                Get.offAll(()=> RoleSelectionScreen());
              },
            ),
          ],
        ),
      ),
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

              /// ✅ Fixed: Drawer Icon with correct context using Builder
              Positioned(
                top: 40,
                left: 16,
                child: Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Icon(
                      Icons.menu,
                      color: AppColor.white,
                      size: 30,
                    ),
                  ),
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
                    child: CircleAvatar(
                      backgroundColor: AppColor.white,
                      radius: 60,
                      child: Center(
                        child: Icon(
                          CupertinoIcons.smiley,
                          size: 123,
                          color: Color(0x90b1b1b1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.all(13),
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Welcome Message",
                        style: GoogleFonts.poppins(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(CupertinoIcons.arrow_right, color: AppColor.white),
                    ],
                  ),
                  SizedBox(height: 7),
                  Text(
                    "The standard Lorem Ipsum passage\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do\neiusmod tempor incididunt ut labore et dolore magna aliqua.",
                    style: GoogleFonts.poppins(color: AppColor.white, fontSize: 12),
                  ),
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

  Widget buildOption(String path, String label, Widget screen) {
    return GestureDetector(
      onTap: () {
        Get.to(() => screen);
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
