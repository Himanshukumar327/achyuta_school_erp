import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultEntryScreen extends StatefulWidget {
  const ResultEntryScreen({super.key});

  @override
  ResultEntryScreenState createState() => ResultEntryScreenState();
}

class ResultEntryScreenState extends State<ResultEntryScreen> {
  String? selectedClass;
  String? selectedSection;
  String? selectedSubject;
  String? selectedExam;
  DateTime selectedDate = DateTime.now();

  final List<String> classes = ["1", "2", "3", "4", "5"];
  final List<String> sections = ["A", "B", "C"];
  final List<String> subjects = ["Math", "Science", "English"];
  final List<String> exams = ["Unit Test", "Mid Term", "Final"];

  final List<Map<String, dynamic>> students = [
    {"roll": 1, "name": "Prajesh Shakya", "marks": ""},
    {"roll": 2, "name": "Rohit Kumar", "marks": ""},
    {"roll": 3, "name": "Anjali Singh", "marks": ""},
    {"roll": 4, "name": "...", "marks": ""},
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
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
        title: "RESULT",
        image: "assets/images/report.png",
        backgroundColor: AppColor.primary,
        imageWidth: 38,imageHeight: 38,
        imageColor: AppColor.white
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First Row (Class - Section)
                    Row(
                      children: [
                        Expanded(
                          child: _buildDropdown("Class", classes, selectedClass,
                                  (val) {
                                setState(() {
                                  selectedClass = val;
                                });
                              }),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildDropdown(
                              "Section", sections, selectedSection, (val) {
                            setState(() {
                              selectedSection = val;
                            });
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    // Second Row (Subject - Date)
                    Row(
                      children: [
                        Expanded(
                          child: _buildDropdown(
                              "Subject", subjects, selectedSubject, (val) {
                            setState(() {
                              selectedSubject = val;
                            });
                          }),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _selectDate(context),
                            child: AbsorbPointer(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: "Date",
                                  suffixIcon: Icon(Icons.calendar_today),
                                  border: OutlineInputBorder(),
                                ),
                                controller: TextEditingController(
                                  text:
                                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),

                    // Exam Dropdown
                    _buildDropdown("Exam", exams, selectedExam, (val) {
                      setState(() {
                        selectedExam = val;
                      });
                    }),
                    SizedBox(height: 16),

                    // Search Button
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        onPressed: () {},
                        child: Text("Search",
                            style:
                            TextStyle(color: AppColor.white, fontSize: 16)),
                      ),
                    ),
                    SizedBox(height: 16),

                    // Table Header
                    Container(
                      color: Colors.grey[200],
                      padding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text("Roll No.",
                                  style:
                                  GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                          Expanded(
                              flex: 2,
                              child: Text("Student Name",
                                  style:
                                  GoogleFonts.poppins(fontWeight: FontWeight.bold))),
                          Expanded(
                              flex: 2,
                              child: Center(
                                child: Text("Marks",
                                    style:
                                    GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                              )),
                        ],
                      ),
                    ),

                    // Student List
                    ...students.map((student) {
                      return Container(
                        padding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(flex: 1, child: Text(student["roll"].toString())),
                            Expanded(flex: 2, child: Text(student["name"])),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8),
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (val) {
                                  student["marks"] = val;
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }),

                    SizedBox(height: 16),

                    // Save Button
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                          padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                        ),
                        onPressed: () {
                          // print(students);
                        },
                        child: Text("Save Result",
                            style:
                            TextStyle(color: AppColor.white, fontSize: 16)),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List<String> items, String? value,
      ValueChanged<String?> onChanged) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      value: value,
      items: items
          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
          .toList(),
      onChanged: onChanged,
    );
  }
}
