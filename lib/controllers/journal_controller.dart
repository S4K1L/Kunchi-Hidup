import 'package:get/get.dart';
import '../models/journal_model.dart';

class JournalController extends GetxController {
  var journals = <JournalModel>[].obs;
  var isLoading = false.obs;

  // Mock fetch — replace with real API call
  Future<void> fetchJournals() async {
    try {
      isLoading(true);
      await Future.delayed(const Duration(seconds: 1)); // simulate API

      // Replace this with actual API response
      final mockData = [
        {
          "id": 1,
          "title": "Your Inner Voice",
          "description":
          "It is a long established fact that a reader will be when looking at its layout. The point of using",
          "created_at": "2025-01-22",
        },
        {
          "id": 2,
          "title": "Day of Reflection",
          "description": "Another journal entry with meaningful content.",
          "created_at": "2025-01-23",
        },
      ];

      journals.value = mockData.map((e) => JournalModel.fromJson(e)).toList();
    } finally {
      isLoading(false);
    }
  }
}
