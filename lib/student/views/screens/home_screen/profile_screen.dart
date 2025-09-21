import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/choose_screen_top_curve_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              TopCurveHeader(
                width: 175,
                height: 175,
                backgroundImage: AssetImage("assets/images/profile_image.png"), child: Text(""),
              ),
              SizedBox(height: 50),
              Padding(padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("ID: 165653",style: GoogleFonts.poppins(color: AppColor.primary,fontSize: 24,fontWeight: FontWeight.w600),),
                  SizedBox(height: 30),
                  profileText(title: "Full Name:",description: "Prajesh Shakya"),
                  SizedBox(height: 12,),
                  profileText(title: "Gender:",description: "9 'B'"),
                  SizedBox(height: 12,),
                  profileText(title: "Roll No:",description: "21"),
                  SizedBox(height: 12,),
                  profileText(title: "Address:",description: "Prajesh Shakya"),
                  SizedBox(height: 12,),
                  profileText(title: "Guardian’s Name:",description: "Prajesh Shakya"),
                  SizedBox(height: 12,),
                  profileText(title: "Guardian’s Contact:",description: "984646464646"),
                  SizedBox(height: 50,),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        height: 50,
                        color: AppColor.primary,
                        shape: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text("Request Edit",style: GoogleFonts.poppins(color: AppColor.white,fontSize: 20),),
                          onPressed: (){}),
                    ),
                  )
                ],
              ),)

            ],
          ),
        ],
      ),
    );
  }

  Widget profileText({String? title,String? description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("$title",style: GoogleFonts.poppins(color: Colors.blue,fontSize: 14),),
        SizedBox(height: 3),
        Text("$description",style: GoogleFonts.poppins(color: AppColor.black,fontSize: 18),)],
    );
  }
}
