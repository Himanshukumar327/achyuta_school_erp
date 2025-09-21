import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/teacher/views/screens/main_screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/choose_screen_top_curve_widget.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 🔹 Top curve with logo
            TopCurveHeader(height: 180,width: 180,
            child: Hero(
              tag: "splash",
              child: Image.asset(
                "assets/images/splash_image.png",
                height: 120,
                fit: BoxFit.contain,
              ),
            ),),

            const SizedBox(height: 120),

            // 🔹 Username field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Username",style: GoogleFonts.poppins(fontSize: 14,fontWeight: FontWeight.w500),),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "AJAY KUMAR",
                      suffixIcon: const Icon(Icons.person, color: AppColor.primary),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.primary, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 🔹 Password field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password"),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "**************",
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.visibility_off, color: AppColor.primary),
                        onPressed: () {
                          // toggle logic
                        },
                      ),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColor.primary, width: 2),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // 🔹 Login Button
            SizedBox(
              width: 300,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(()=> MainScreen());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 16, color: AppColor.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
