import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final int currentIndex;

  const ProgressBar({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6, (index) {
        return Container(
          width: 52,
          height: 4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(1),
            color: index <= currentIndex ? Colors.white : Colors.white.withOpacity(0.2),
          ),
        );
      }),
    );
  }
}
