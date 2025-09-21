class Solution {
  final String question;
  final String answer;
  final String? fileName;
  final String? filePath; // ✅ नया field

  Solution({
    required this.question,
    required this.answer,
    this.fileName,
    this.filePath,
  });
}
