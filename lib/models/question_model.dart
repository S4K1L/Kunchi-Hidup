class QuestionResultModel {
  final String question;
  final String answer;
  final bool isCorrect;

  QuestionResultModel({
    required this.question,
    required this.answer,
    this.isCorrect = true,
  });
}
