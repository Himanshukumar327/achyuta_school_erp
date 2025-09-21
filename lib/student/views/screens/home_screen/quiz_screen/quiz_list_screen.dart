import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/screens/home_screen/quiz_screen/quiz_question_screen.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizListScreen extends StatelessWidget {
  const QuizListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quizzes = [
      {"title": "Math Quiz", "icon": Icons.calculate, "color": Colors.orange},
      {"title": "Science Quiz", "icon": Icons.science, "color": Colors.green},
      {"title": "History Quiz", "icon": Icons.history_edu, "color": Colors.red},
    ];

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        image: "assets/images/notice.png",
        imageColor: AppColor.white,
        imageHeight: 38,imageWidth: 38,
        title: "Quizzes",
        backgroundColor: AppColor.primary
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            const SizedBox(height: 20),

            // 🔹 Quiz List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: quizzes.length,
                itemBuilder: (context, index) {
                  final quiz = quizzes[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuizQuestionScreen(
                            quizTitle: "${quiz['title']}",
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      color: AppColor.white,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: CircleAvatar(
                          backgroundColor: quiz['color'] as Color,
                          child: Icon(
                            quiz['icon'] as IconData,
                            color: AppColor.white,
                          ),
                        ),
                        title: Text(
                          "${quiz['title']}",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                      ),
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
}
