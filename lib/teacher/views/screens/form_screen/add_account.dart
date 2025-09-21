import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/choose_screen_top_curve_widget.dart';
import 'package:achuya_erp/teacher/views/widget/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAccount extends StatelessWidget {
   AddAccount({super.key});
  final TextEditingController fullName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController classController = TextEditingController();
  final TextEditingController section = TextEditingController();
  final TextEditingController rollNo = TextEditingController();
  final TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: ListView(
          // physics: BouncingScrollPhysics(),
          children: [
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
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
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFF28C2A0),
                            width: 4,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center, // center me
                          children: [
                            Icon(
                              Icons.add,
                              size: 90,
                              color: Color(0xc3b1b1b1),
                            ),
                            // const SizedBox(height: 8),
                            Text(
                              "Add Photo",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF28C2A0),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Full Name",style: GoogleFonts.poppins(fontWeight: FontWeight.w700),),
                      SizedBox(height: 10,),
                      buildFormField(controller: fullName,keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "Enter Something.....",
                              hintStyle: GoogleFonts.poppins(color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                          )),
                      SizedBox(height: 10,),
                      Text("Email",style: GoogleFonts.poppins(fontWeight: FontWeight.w700),),
                      SizedBox(height: 10,),
                      buildFormField(controller: email,keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "Enter Something.....",
                              hintStyle: GoogleFonts.poppins(color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                          )),
                      SizedBox(height: 10,),
                      Text("Class",style: GoogleFonts.poppins(fontWeight: FontWeight.w700),),
                      SizedBox(height: 10,),
                      buildFormField(controller: classController,keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "Enter Something.....",
                              hintStyle: GoogleFonts.poppins(color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                          )),
                      SizedBox(height: 10,),
                      Text("Section",style: GoogleFonts.poppins(fontWeight: FontWeight.w700),),
                      SizedBox(height: 10,),
                      buildFormField(controller: section,keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "Enter Something.....",
                              hintStyle: GoogleFonts.poppins(color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                          )),
                      SizedBox(height: 10,),
                      Text("Roll No.",style: GoogleFonts.poppins(fontWeight: FontWeight.w700),),
                      SizedBox(height: 10,),
                      buildFormField(controller: rollNo,keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "Enter Something.....",
                              hintStyle: GoogleFonts.poppins(color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                          )),
                      SizedBox(height: 10,),
                      Text("Address",style: GoogleFonts.poppins(fontWeight: FontWeight.w700),),
                      SizedBox(height: 10,),
                      buildFormField(controller: address,keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                              hintText: "Enter Something.....",
                              hintStyle: GoogleFonts.poppins(color: Colors.grey),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5))
                          )),
                      SizedBox(height: 30,),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: SizedBox(
                          width: double.infinity,
                          child: MaterialButton(
                            height: 52,
                            onPressed: (){},
                            color: AppColor.primary,
                            shape: OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(10)),
                            child: Text("Add Student",style: GoogleFonts.poppins(color: AppColor.white,fontSize: 18),),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
