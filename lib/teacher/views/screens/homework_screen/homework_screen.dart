import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_file/open_file.dart';


class Homework {
  final String subject;
  final String details;
  final String date;
  final String teacher;
  final String section;
  final String priority;
  final String? filePath;

  Homework(this.subject, this.details, this.date, this.teacher, this.section,
      this.priority,
      {this.filePath});
}

class HomeworkScreen extends StatefulWidget {
  const HomeworkScreen({super.key});

  @override
  State<HomeworkScreen> createState() => _HomeworkScreenState();
}

class _HomeworkScreenState extends State<HomeworkScreen> {
  final List<Homework> homeworkList = [
    Homework("Math Homework", "Chapter 5 Algebra", "12 Sept", "Mr. Sharma",
        "Class 8A", "High"),
    Homework("Science Project", "Solar System Model", "14 Sept", "Mrs. Gupta",
        "Class 8A", "Medium"),
  ];

  void _addHomework(Homework hw) {
    setState(() {
      homeworkList.add(hw);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        image: "assets/images/homework.png",
        imageColor: AppColor.white,
        imageHeight: 38,imageWidth: 38,
        backgroundColor: AppColor.primary,
        title: "HOMEWORK"
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // const SizedBox(height: 16),
                    Expanded(
                      child: homeworkList.isEmpty
                          ? const Center(
                        child: Text(
                          "No Homework Assigned Yet!",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                          : ListView.builder(
                        itemCount: homeworkList.length,
                        itemBuilder: (context, index) {
                          final hw = homeworkList[index];
                          return Card(
                            color: AppColor.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const CircleAvatar(
                                        backgroundColor: Color(0xef154dc6),
                                        child:
                                        Icon(Icons.book, color: AppColor.white),
                                      ),
                                      const SizedBox(width: 12),
                                      Expanded(
                                        child: Text(
                                          hw.subject,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                      ),
                                      Text(
                                        hw.date,
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(hw.details),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("👩‍🏫 ${hw.teacher}"),
                                      Text("🏫 ${hw.section}"),
                                      Chip(
                                        label: Text(hw.priority),
                                        backgroundColor: hw.priority == "High"
                                            ? Colors.red[100]
                                            : hw.priority == "Medium"
                                            ? Colors.orange[100]
                                            : Colors.green[100],
                                      ),
                                    ],
                                  ),
                                  if (hw.filePath != null) ...[
                                    const Divider(),
                                    InkWell(
                                      onTap: () {
                                        OpenFile.open(hw.filePath!);
                                      },
                                      child:Row(
                                        children: [
                                          const Icon(Icons.attach_file, color: Color(0xEF154DC6)),
                                          const SizedBox(width: 6),
                                          Expanded(   // 👈 yaha wrap kiya
                                            child: Text(
                                              hw.filePath!.split('/').last,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                color: Colors.blue,
                                                decoration: TextDecoration.underline,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddHomeworkScreen()),
          );
          if (result != null && result is Homework) {
            _addHomework(result);
          }
        },
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [Color(0xef154dc6), Color(0xef154dc6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.add, color: AppColor.white,size: 35,),
        ),
      ),
    );
  }
}

class AddHomeworkScreen extends StatefulWidget {
  const AddHomeworkScreen({super.key});

  @override
  State<AddHomeworkScreen> createState() => _AddHomeworkScreenState();
}

class _AddHomeworkScreenState extends State<AddHomeworkScreen> {
  final _formKey = GlobalKey<FormState>();
  final subjectController = TextEditingController();
  final detailsController = TextEditingController();
  final dateController = TextEditingController();
  final teacherController = TextEditingController();
  final sectionController = TextEditingController();
  String priority = "Medium";

  String? pickedFilePath;

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      setState(() {
        pickedFilePath = result.files.single.path!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        title: "UPLOAD HOMEWORK",
        backgroundColor: AppColor.primary,
        image: "assets/images/homework.png",
        imageWidth: 38,imageHeight: 38,
        imageColor: AppColor.white
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      _buildTextField(subjectController, "Subject"),
                      const SizedBox(height: 12),
                      _buildTextField(detailsController, "Homework Details",
                          maxLines: 3),
                      const SizedBox(height: 12),
                      _buildTextField(dateController, "Due Date (e.g. 20 Sept)"),
                      const SizedBox(height: 12),
                      _buildTextField(teacherController, "Teacher Name"),
                      const SizedBox(height: 12),
                      _buildTextField(sectionController, "Class/Section"),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        dropdownColor: AppColor.white,
                        value: priority,
                        items: ["High", "Medium", "Low"]
                            .map((p) => DropdownMenuItem(value: p, child: Text(p)))
                            .toList(),
                        onChanged: (val) => setState(() => priority = val!),
                        decoration: InputDecoration(

                          labelText: "Priority",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF28C2A0),Color(0xFF28C2A0)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent, // gradient dikhe
                            shadowColor: Colors.transparent,     // shadow remove
                          ),
                          onPressed: _pickFile,
                          icon: const Icon(Icons.attach_file, color: AppColor.white),
                          label: Text(
                            pickedFilePath == null
                                ? "Upload File"
                                : "File Selected: ${pickedFilePath!.split('/').last}",
                            style: GoogleFonts.poppins(color: AppColor.white),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xEF154DC6),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final hw = Homework(
                              subjectController.text,
                              detailsController.text,
                              dateController.text,
                              teacherController.text,
                              sectionController.text,
                              priority,
                              filePath: pickedFilePath,
                            );
                            Navigator.pop(context, hw);
                          }
                        },
                        icon: const Icon(Icons.check,color: AppColor.white,),
                        label: Text(
                          "Assign Homework",
                          style: GoogleFonts.poppins(color: AppColor.white,fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      validator: (value) => value!.isEmpty ? "Enter $label" : null,
    );
  }
}
