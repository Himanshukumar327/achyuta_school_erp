import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SchoolProfileScreen extends StatelessWidget {
  final Color primaryColor = AppColor.primary;

  const SchoolProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        image: "assets/images/drawer_school_img.png",
        backgroundColor: AppColor.primary,
        imageColor: AppColor.white,
        imageHeight: 37,imageWidth: 37,
        title: "SCHOOL PROFILE"
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Center(
              child: ClipOval(
                child: Image.asset(
                  "assets/images/splash_image.png",
                  width: 180,
                  height: 180,
                  fit: BoxFit.fill, // This fills the circle
                ),
              ),

            ),

            const SizedBox(height: 20),

            // School Name
            Text(
              "St. Xavier's International School",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 24,
                color: primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            // Motto or Tagline
            Text(
              "Inspiring Excellence & Leadership",
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),

            const SizedBox(height: 20),

            // Info Card
            Card(
              color: AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    InfoRow(
                      icon: Icons.location_on,
                      label: "Location",
                      value: "123 School Road, New Delhi, India",
                    ),
                    const Divider(),

                    InfoRow(
                      icon: Icons.person,
                      label: "Principal",
                      value: "Mrs. Priya Sharma",
                    ),
                    const Divider(),

                    InfoRow(
                      icon: Icons.calendar_today,
                      label: "Established",
                      value: "1995",
                    ),
                    const Divider(),

                    InfoRow(
                      icon: Icons.phone,
                      label: "Contact",
                      value: "+91 98765 43210",
                    ),
                    const Divider(),

                    InfoRow(
                      icon: Icons.email,
                      label: "Email",
                      value: "info@stxavierschool.edu.in",
                    ),
                    const Divider(),

                    InfoRow(
                      icon: Icons.web,
                      label: "Website",
                      value: "www.stxavierschool.edu.in",
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // About Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: primaryColor.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About the School",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "St. Xavier's International School is dedicated to providing holistic education that nurtures academic excellence, leadership, and global citizenship. Our mission is to empower students with knowledge, skills, and values for a better future.",
                    style: GoogleFonts.poppins(fontSize: 15, height: 1.4),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: AppColor.primary, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "$label:",
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
