import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'exam_route_list.dart';

const Color primaryBlue = AppColor.primary;

class ExamRouteScreen extends StatefulWidget {
  const ExamRouteScreen({super.key});

  @override
  State<ExamRouteScreen> createState() => _ExamRouteScreenState();
}

class _ExamRouteScreenState extends State<ExamRouteScreen> {
  String? selectedClass;
  String? selectedSection;
  String? selectedExam;
TextEditingController examControllers = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = const TimeOfDay(hour: 10, minute: 0);

  final List<String> classes = ['1', '2', '3', '4', '5'];
  final List<String> sections = ['A', 'B', 'C'];
  final List<String> exams = ['Unit Test', 'Mid Term', 'Final'];

  Future<void> _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }


// Inside your State
  TimeOfDay startTime = const TimeOfDay(hour: 10, minute: 0);
  TimeOfDay endTime = const TimeOfDay(hour: 12, minute: 0);

  Future<void> _pickStartTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: startTime,
    );
    if (picked != null) setState(() => startTime = picked);
  }

  Future<void> _pickEndTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: endTime,
    );
    if (picked != null) setState(() => endTime = picked);
  }

  String _formattedTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final suffix = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')} $suffix';
  }


  String _formattedsDate() =>
      '${selectedDate.day.toString().padLeft(2, '0')}-${selectedDate.month.toString().padLeft(2, '0')}-${selectedDate.year}';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        image: "assets/images/exam_route.png",
        title: "UPLOAD EXAM ROUTE",
        backgroundColor: AppColor.primary,
        imageWidth: 38,imageHeight: 38,
        imageColor: AppColor.white
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding:
                const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ajay Kumar',
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 18),
                    _label('Exam Name'),
                    SizedBox(height: 5,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter exam name ',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 16),
                      ),
                      controller: examControllers,
                    ),
                    _label('Class'),
                    const SizedBox(height: 8),
                    _dropdownBox(
                      value: selectedClass,
                      hint: 'Select Class',
                      items: classes,
                      onChanged: (v) => setState(() => selectedClass = v),
                    ),
                    const SizedBox(height: 16),
                    _label('Section'),
                    const SizedBox(height: 8),
                    _dropdownBox(
                      value: selectedSection,
                      hint: 'Select Section',
                      items: sections,
                      onChanged: (v) => setState(() => selectedSection = v),
                    ),
                    const SizedBox(height: 16),
                    _label('Exam'),
                    const SizedBox(height: 8),
                    _dropdownBox(
                      value: selectedExam,
                      hint: 'Select Exam',
                      items: exams,
                      onChanged: (v) => setState(() => selectedExam = v),
                    ),
                    const SizedBox(height: 16),
                    _label('Date'),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: _pickDate,
                      child: AbsorbPointer(
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Select date',
                            suffixIcon: const Icon(Icons.calendar_today),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 16),
                          ),
                          controller:
                          TextEditingController(text: _formattedsDate()),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Time picker
                    _label('Time'),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: _pickStartTime,
                            child: AbsorbPointer(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Start Time',
                                  suffixIcon: const Icon(Icons.access_time),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 16),
                                ),
                                controller: TextEditingController(
                                    text: _formattedTime(startTime)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: GestureDetector(
                            onTap: _pickEndTime,
                            child: AbsorbPointer(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'End Time',
                                  suffixIcon: const Icon(Icons.access_time),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 16),
                                ),
                                controller: TextEditingController(
                                    text: _formattedTime(endTime)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),

                    // Start Exam Button
                    SizedBox(
                      width: double.infinity,
                      height: 72,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          textStyle: const TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (selectedClass == null ||
                              selectedSection == null ||
                              selectedExam == null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Please select Class, Section, Exam, Date and Time'),
                              ),
                            );
                            return;
                          }

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExamRouteListScreen(
                              ),
                            ),
                          );

                        },
                        child: Text('Start Exam',style: GoogleFonts.poppins(color: AppColor.white),),
                      ),
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

  Widget _label(String txt) => Text(
    txt,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  );

  Widget _dropdownBox({
    required String? value,
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          border: InputBorder.none,
        ),
        isExpanded: true,
        hint: Text(hint),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}
