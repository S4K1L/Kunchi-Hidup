import 'package:get/get.dart';

import '../models/question_model.dart';

class QuestionResultsController extends GetxController {
  var results = <QuestionResultModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchResults();
  }

  Future<void> fetchResults() async {
    await Future.delayed(const Duration(seconds: 1));
    results.value = [
      QuestionResultModel(
        question: "Apakah kamu merasa terputus dari tubuhmu atau sulit menikmati hidup tanpa rasa bersalah?",
        answer: "Yes",
      ),
      QuestionResultModel(
        question: "Apakah kamu sering merasa cemas tanpa alasan yang jelas?",
        answer: "No",
      ),
      QuestionResultModel(
        question: "Apakah kamu sering merasa cemas tanpa alasan yang jelas?",
        answer: "No",
      ),
      QuestionResultModel(
        question: "Apakah kamu sering merasa cemas tanpa alasan yang jelas?",
        answer: "No",
      ),
      QuestionResultModel(
        question: "Apakah kamu sering merasa cemas tanpa alasan yang jelas?",
        answer: "Sometimes",
      ),
    ];
  }
}
