import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentResultScreen extends StatefulWidget {
  const StudentResultScreen({super.key});

  @override
  State<StudentResultScreen> createState() => _StudentResultScreenState();
}

class _StudentResultScreenState extends State<StudentResultScreen> {
  String? selectedClass;
  String? selectedSection;
  String? selectedSubject;
  String? selectedExam;
  String? rollNumber;

  final List<String> classes = ["1", "2", "3", "4", "5"];
  final List<String> sections = ["A", "B", "C"];
  final List<String> subjects = ["Math", "Science", "English"];
  final List<String> exams = ["Unit Test", "Mid Term", "Final"];

  Map<String, dynamic>? resultData;

  final dummyResults = [
    {
      "class": "3",
      "section": "A",
      "roll": "1",
      "name": "Prajesh Shakya",
      "subject": "Math",
      "exam": "Mid Term",
      "marks": "88",
      "date": "12/08/2025",
    },
    {
      "class": "3",
      "section": "A",
      "roll": "2",
      "name": "Rohit Kumar",
      "subject": "Science",
      "exam": "Final",
      "marks": "74",
      "date": "10/09/2025",
    },
  ];

  void _searchResult() {
    final found = dummyResults.firstWhere(
      (res) =>
          res["class"] == selectedClass &&
          res["section"] == selectedSection &&
          res["roll"] == rollNumber &&
          res["subject"] == selectedSubject &&
          res["exam"] == selectedExam,
      orElse: () => {},
    );

    setState(() {
      resultData = found.isNotEmpty ? found : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        image: "assets/images/report.png",
        imageColor: AppColor.white,
        imageHeight: 38,imageWidth: 38,
        title: "VIEW RESULT",backgroundColor: AppColor.primary
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
                  children: [
                    // Class and Section
                    Row(
                      children: [
                        Expanded(
                          child: _buildDropdown(
                            "Class",
                            classes,
                            selectedClass,
                            (val) {
                              setState(() => selectedClass = val);
                            },
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildDropdown(
                            "Section",
                            sections,
                            selectedSection,
                            (val) {
                              setState(() => selectedSection = val);
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 12),

                    // Subject and Exam
                    Row(
                      children: [
                        Expanded(
                          child: _buildDropdown(
                            "Subject",
                            subjects,
                            selectedSubject,
                            (val) {
                              setState(() => selectedSubject = val);
                            },
                          ),
                        ),
                        SizedBox(width: 12),
                        Expanded(
                          child: _buildDropdown("Exam", exams, selectedExam, (
                            val,
                          ) {
                            setState(() => selectedExam = val);
                          }),
                        ),
                      ],
                    ),

                    SizedBox(height: 12),

                    // Roll Number
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: "Roll Number",
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      onChanged: (val) => rollNumber = val,
                    ),

                    SizedBox(height: 16),

                    // Search Button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.primary,
                        padding: EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                        ),
                      ),
                      onPressed: _searchResult,
                      child: Text(
                        "Search Result",
                        style: TextStyle(color: AppColor.white, fontSize: 16),
                      ),
                    ),

                    SizedBox(height: 24),

                    // Result Display
                    if (resultData != null)
                      Card(
                        color: AppColor.white,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text(
                                    resultData!["name"],
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Divider(height: 25, thickness: 1),
                              _buildResultRow("Class", resultData!["class"]),
                              _buildResultRow(
                                "Section",
                                resultData!["section"],
                              ),
                              _buildResultRow("Roll No", resultData!["roll"]),
                              _buildResultRow(
                                "Subject",
                                resultData!["subject"],
                              ),
                              _buildResultRow("Exam", resultData!["exam"]),
                              _buildResultRow(
                                "Marks",
                                resultData!["marks"],
                                valueColor: Colors.green,
                              ),
                              _buildResultRow("Date", resultData!["date"]),
                            ],
                          ),
                        ),
                      )
                    else if (resultData == null && rollNumber != null)
                      Text(
                        "Result not found!",
                        style: TextStyle(color: Colors.red),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(

        children: [
          Expanded(
            flex: 3,
            child: Text(
              "$label:",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: TextStyle(fontSize: 16, color: valueColor ?? AppColor.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(
    String label,
    List<String> items,
    String? value,
    ValueChanged<String?> onChanged,
  ) {
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
