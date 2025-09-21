import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/screens/auth/choose_role_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _scale = 0.5;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();

    /// Animate logo when screen starts
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {  // Add mounted check to avoid setState after dispose
        setState(() {
          _scale = 1.0;
          _opacity = 1.0;
        });
      }
    });

    /// Navigate to RoleSelectionScreen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Get.offAll(() => RoleSelectionScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.white,
      body: Stack(
        children: [
          /// 🔹 Top Left Quarter Circle (Responsive)
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: screenWidth * 0.3,  // Responsive
              width: screenWidth * 0.3,
              decoration: const BoxDecoration(
                color: Color(0xFF28C2A0),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120),
                ),
              ),
            ),
          ),

          /// 🔹 Bottom Half-Circle (Responsive)
          Positioned(
            bottom: 0,
            left: screenWidth * 0.02,  // Padding responsive
            right: screenWidth * 0.02,
            child: ClipPath(
              clipper: BottomCurveClipper(),
              child: Container(
                height: screenHeight * 0.10,  // Responsive height
                decoration: const BoxDecoration(
                  color: AppColor.primary,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(300),
                    topRight: Radius.circular(300),
                  ),
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Powered by Achyuta",
                    style: GoogleFonts.poppins(
                      color: AppColor.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),

          /// 🔹 Center Logo with Animation
          Center(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 1200),
              opacity: _opacity,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 1200),
                scale: _scale,
                curve: Curves.easeOutBack,
                child: Hero(
                  tag: "splash",
                  child: Image.asset(
                    "assets/images/splash_image.png",
                    height: 180,
                    errorBuilder: (context, error, stackTrace) =>  // Error handling
                    Icon(Icons.image_not_supported, size: 180, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Improved Custom clipper for bottom curve (fixed for inwards wave like your image)
class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 0);
    path.quadraticBezierTo(
      size.width / 2, size.height * 0.0,  // Positive y for inwards curve (adjust 0.6 for tightness)
      size.width, 0,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}