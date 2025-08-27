import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AskWithInController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final RxList<Map<String, String>> messages = <Map<String, String>>[].obs;

  void sendMessage() {
    final text = textController.text.trim();
    if (text.isEmpty) return;

    _addMessage(text);
    textController.clear();
  }

  void sendQuickMessage(String text) {
    _addMessage(text);
  }

  void _addMessage(String text) {
    messages.add({'role': 'user', 'text': text});

    // Fake AI reply
    Future.delayed(const Duration(seconds: 1), () {
      messages.add({'role': 'ai', 'text': "AI reply to: $text"});
    });
  }
}
