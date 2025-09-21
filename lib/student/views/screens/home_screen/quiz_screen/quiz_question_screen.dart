import 'package:achuya_erp/app_color.dart';
import 'package:achuya_erp/student/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizQuestionScreen extends StatefulWidget {
  final String quizTitle;

  const QuizQuestionScreen({super.key, required this.quizTitle});

  @override
  State<QuizQuestionScreen> createState() => _QuizQuestionScreenState();
}

class _QuizQuestionScreenState extends State<QuizQuestionScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedOptionIndex;
  List<int?> selectedAnswers = [];

  // Example questions with options and correct answer index
  final List<Map<String, dynamic>> questions = [
    {
      "question": "What is 2 + 2?",
      "options": ["3", "4", "5", "6"],
      "answerIndex": 1,
    },
    {
      "question": "What is the capital of France?",
      "options": ["Paris", "London", "Berlin", "Madrid"],
      "answerIndex": 0,
    },
    {
      "question": "Who discovered gravity?",
      "options": ["Newton", "Einstein", "Tesla", "Galileo"],
      "answerIndex": 0,
    },
  ];

  bool showResult = false;

  @override
  void initState() {
    super.initState();
    selectedAnswers = List.filled(questions.length, null);
  }

  void _onOptionSelected(int index) {
    setState(() {
      selectedOptionIndex = index;
      selectedAnswers[currentQuestionIndex] = index;
    });
  }

  void _onNextPressed() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptionIndex = selectedAnswers[currentQuestionIndex];
      });
    } else {
      // Calculate score
      score = 0;
      for (int i = 0; i < questions.length; i++) {
        if (selectedAnswers[i] == questions[i]['answerIndex']) {
          score++;
        }
      }
      setState(() {
        showResult = true;
      });
    }
  }

  void _onBackPressed() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
        selectedOptionIndex = selectedAnswers[currentQuestionIndex];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: customAppBar(
        image: "assets/images/notice.png",
        backgroundColor: AppColor.primary,
        title: widget.quizTitle,
        imageWidth: 38,imageHeight: 38,
        imageColor: AppColor.white

      ),
      body: SafeArea(
        child: showResult ? _buildResult() : _buildQuiz(),
      ),
    );
  }

  Widget _buildQuiz() {
    final question = questions[currentQuestionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // _buildAppBar(widget.quizTitle),

        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            "Q${currentQuestionIndex + 1}: ${question['question']}",
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        ...List.generate(question['options'].length, (index) {
          final isSelected = selectedOptionIndex == index;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                isSelected ? AppColor.primary : AppColor.white,
                foregroundColor: isSelected ? AppColor.white : AppColor.black,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: isSelected
                        ? AppColor.primary
                        : Colors.grey.shade300,
                    width: 1.5,
                  ),
                ),
              ),
              onPressed: () => _onOptionSelected(index),
              child: Text(
                question['options'][index],
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }),

        const Spacer(),

        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              // 🔙 BACK button
              if (currentQuestionIndex > 0)
                Expanded(
                  child: ElevatedButton(
                    onPressed: _onBackPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade300,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      "Back",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                ),
              if (currentQuestionIndex > 0) const SizedBox(width: 10),

              // ▶️ NEXT / FINISH
              Expanded(
                child: ElevatedButton(
                  onPressed:
                  selectedOptionIndex != null ? _onNextPressed : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    currentQuestionIndex == questions.length - 1
                        ? "Finish Quiz"
                        : "Next",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResult() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Center(
            child: Text(
              "You scored $score / ${questions.length}",
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.primary,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "Back to Quiz List",
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColor.white,
              ),
            ),
          ),
        )
      ],
    );
  }

}
