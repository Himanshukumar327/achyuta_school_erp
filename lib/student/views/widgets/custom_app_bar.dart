import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


PreferredSizeWidget customAppBar({
  String? image,
  double? imageHeight,
  double? imageWidth,
  String? title,
  Color? backgroundColor,
  Color? imageColor,
}) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Image.asset(
        "$image",
        height: imageHeight,
        width: imageWidth,
        fit: BoxFit.contain,
        color: imageColor,
      ),
    ),
    title: Text(
      "$title",overflow: TextOverflow.ellipsis,
      style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w500),
    ),
    backgroundColor: backgroundColor,
    foregroundColor: Colors.white,
    elevation: 4,
  );
}
