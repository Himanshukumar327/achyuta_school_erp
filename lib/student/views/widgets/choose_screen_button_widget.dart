import 'package:achuya_erp/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildOption(IconData icon, String label) {
  return Column(
    children: [
      Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          color: AppColor.primary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: AppColor.white, size: 60),
      ),
      const SizedBox(height: 8),
      Text(
        label,
        style: GoogleFonts.poppins(color: AppColor.black, fontSize: 14),
      ),
    ],
  );
}
