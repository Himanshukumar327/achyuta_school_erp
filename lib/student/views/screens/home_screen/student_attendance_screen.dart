import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class StudentAttendanceScreen extends StatefulWidget {
  const StudentAttendanceScreen({super.key});

  @override
  State<StudentAttendanceScreen> createState() => _StudentAttendanceScreenState();
}

class _StudentAttendanceScreenState extends State<StudentAttendanceScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  final Map<String, String> attendanceData = {
    "2025-09-01": "Present",
    "2025-09-02": "Absent",
    "2025-09-03": "Present",
    "2025-09-04": "Leave",
    "2025-09-05": "Absent",
    "2025-09-06": "Present",
    "2025-09-07": "Present",
    "2025-09-08": "Absent",
    "2025-09-09": "Present",
    "2025-09-10": "Leave",
    "2025-08-28": "Absent",
  };

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    final currentMonthDates = getCurrentMonthDates(_focusedDay);

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        backgroundColor: AppColor.primary,
        title: "ATTENDANCE",
        image: "assets/images/attendance.png",
        imageColor: AppColor.white,
        imageHeight: 38,
        imageWidth: 38
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10,),
            /// 📅 Calendar
            TableCalendar(
              firstDay: DateTime.utc(2022, 1, 1),
              lastDay: DateTime.now(), // 👈 restrict to today only
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              onDaySelected: (selectedDay, focusedDay) {
                if (selectedDay.isAfter(DateTime.now())) return; // 👈 Block future selection
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.orange,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            const SizedBox(height: 10),

            /// 🗓 Month Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Icon(Icons.calendar_today, size: 18, color: Colors.blueGrey),
                  const SizedBox(width: 8),
                  Text(
                    DateFormat.yMMMM().format(_focusedDay),
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            /// 📋 Stylish Attendance List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: currentMonthDates.length,
                itemBuilder: (context, index) {
                  final date = currentMonthDates[index];
                  final formattedDate = DateFormat('yyyy-MM-dd').format(date);
                  final status = attendanceData[formattedDate] ?? "No Record";

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          blurRadius: 6,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundColor:
                          getStatusColor(status).withOpacity(0.15),
                          child: Icon(
                            getStatusIcon(status),
                            color: getStatusColor(status),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Text(
                            DateFormat('EEE, MMM d').format(date),
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: getStatusColor(status).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: getStatusColor(status),
                              width: 1,
                            ),
                          ),
                          child: Text(
                            status,
                            style: GoogleFonts.poppins(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: getStatusColor(status),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DateTime> getCurrentMonthDates(DateTime month) {
    final now = DateTime.now();
    final first = DateTime(month.year, month.month, 1);
    final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);

    final last = (month.year == now.year && month.month == now.month)
        ? now // 👈 If current month, limit to today
        : lastDayOfMonth;

    return List.generate(
      last.day,
          (index) => DateTime(month.year, month.month, index + 1),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Present":
        return Colors.green;
      case "Absent":
        return Colors.red;
      case "Leave":
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  IconData getStatusIcon(String status) {
    switch (status) {
      case "Present":
        return Icons.check_circle;
      case "Absent":
        return Icons.cancel;
      case "Leave":
        return Icons.event_busy;
      default:
        return Icons.help_outline;
    }
  }
}
