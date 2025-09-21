import 'package:flutter/material.dart';

class TopCurveHeader extends StatelessWidget {
  // final String imagePath;
  final double width;
  final double height;
  final Widget child;
  final ImageProvider<Object>? backgroundImage;
  const TopCurveHeader({
    super.key,
    required this.width,
   required this.height,
    required this.child,
    this.backgroundImage
    // required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
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
            width: width,
            height: width,
            decoration: BoxDecoration(
              color: Colors.white,
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
                    backgroundColor: Colors.white,
                    backgroundImage: backgroundImage,
                    radius: 75,
                    child: child,
                  ),

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Tumhara Clipper yahi rehga
class TopCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 110);
    path.quadraticBezierTo(
      size.width / 2, size.height + 40,
      size.width, size.height - 100,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
