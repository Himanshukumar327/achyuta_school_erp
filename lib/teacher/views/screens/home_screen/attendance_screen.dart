import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String? selectedClass;
  String? selectedSection;
  DateTime selectedDate = DateTime.now();

  bool showData = false; // 👈 ye control karega ki table dikhna hai ya nahi

  final List<String> classes = ["1", "2", "3", "4", "5"];
  final List<String> sections = ["A", "B", "C"];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: customAppBar(
        title: "ATTENDANCE",
        image: "assets/images/attendance.png",
        imageColor: AppColor.white,
        imageHeight: 38,imageWidth: 38,
        backgroundColor: AppColor.primary
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(

                children: [
                  // Header Section with Dropdowns
                  // SizedBox(height: 10,),
                  Container(
                    color: Color(0xef6f88bf),
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 12),

                        // Row for Class + Section
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: selectedClass,
                                    hint: Text("Select Class",style: GoogleFonts.poppins(),),
                                    isExpanded: true,
                                    items: classes
                                        .map((c) => DropdownMenuItem(
                                        value: c, child: Text(c)))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedClass = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: selectedSection,
                                    hint: Text("Select Section",style: GoogleFonts.poppins(),),
                                    isExpanded: true,
                                    items: sections
                                        .map((s) => DropdownMenuItem(
                                        value: s, child: Text(s)))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedSection = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 12),

                        // Row for Date + Search
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => _selectDate(context),
                                child: Container(
                                  padding:
                                  EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: AppColor.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                    style: GoogleFonts.poppins(color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColor.white,
                                foregroundColor: AppColor.black,
                              ),
                              onPressed: () {
                                if (selectedClass != null &&
                                    selectedSection != null) {
                                  setState(() {
                                    showData = true; // 👈 Search dabane ke baad table show
                                  });
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                      content: Text("Please select class & section",style: GoogleFonts.poppins(),)));
                                }
                              },
                              child: Text("Search",style: GoogleFonts.poppins(),),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Agar search dabaya to niche table show hoga
                  if (showData) ...[
                    // Table Header
                    Container(
                      color: Colors.grey[300],
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Text("Student Name",
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text("Present",
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                          Expanded(
                              child: Text("Absent",
                                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),

                    // Student List
                    Expanded(
                      child: ListView.builder(
                        itemCount: 15,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              children: [
                                Expanded(flex: 2, child: Text("Prajesh Shakya",style: GoogleFonts.poppins(),)),
                                Expanded(
                                    child: Checkbox(value: false, onChanged: (_) {})),
                                Expanded(
                                    child: Checkbox(value: false, onChanged: (_) {})),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ]
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
