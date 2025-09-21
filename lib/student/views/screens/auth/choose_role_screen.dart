import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/screens/auth/login_screen.dart';
import 'package:achuya_erp/student/views/screens/home_screen/student_home_screen.dart';
import 'package:achuya_erp/student/views/widgets/choose_screen_button_widget.dart';
import 'package:achuya_erp/student/views/widgets/choose_screen_top_curve_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TopCurveHeader(width: 180,height: 180
            ,child: Hero(
              tag: "splash",
              child: Image.asset(
                "assets/images/splash_image.png",
                height: 120,
                fit: BoxFit.contain,
              ),
            ),),
          const SizedBox(height: 90),
          Text(
            "Choose your option",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.primary,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> HomeScreen());
                      },
                        child: buildOption(Icons.school, "Student")),
                    SizedBox(width: 15,),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> LoginScreen());
                      },
                        child: buildOption(Icons.person, "Teacher")),
                  ],
                ),
                const SizedBox(height: 25),
                Center(
                  child: buildOption(Icons.account_circle, "Guest"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

