import 'package:get/get.dart';
import '../models/task_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TaskController extends GetxController {
  var tasks = <TaskModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTasks(); // auto-fetch on init
  }

  Future<void> fetchTasks() async {
    try {
      isLoading.value = true;

      // Replace with your real API later
      final response =
      await http.get(Uri.parse("https://api.example.com/tasks"));

      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        tasks.value = data.map((e) => TaskModel.fromJson(e)).toList();
      } else {
        _loadDummyData(); // fallback
      }
    } catch (e) {
      _loadDummyData(); // fallback on error
    } finally {
      isLoading.value = false;
    }
  }

  void _loadDummyData() {
    tasks.value = [
      TaskModel(
        id: 1,
        progress: false,
        title: "Meditation Practice",
        description: "Spend 20 minutes in mindful meditation.",
        date: DateTime(2025,08,26),
      ),
      TaskModel(
        id: 2,
        progress: true,
        title: "Yoga Flow",
        description: "Complete a 30-minute chakra-balancing yoga session.",
        date: DateTime(2025,08,26),
        completeDate: DateTime(2025,08,30),
      ),
      TaskModel(
        id: 3,
        progress: false,
        title: "Journaling",
        description: "Reflect on your healing journey for this week.",
        date: DateTime(2025,08,26),
      ),
      TaskModel(
        id: 4,
        progress: false,
        title: "Community Sharing",
        description: "Share your spiral insights with the group.",
        date: DateTime(2025,08,26),
      ),
    ];
  }
}
