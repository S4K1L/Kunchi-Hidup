import 'package:flutter/material.dart';

import '../../utils/custom_svg.dart';

class QuestionButton extends StatelessWidget {
  final String title;
  final String assets;
  final bool isSelected;
  final VoidCallback onTap;

  const QuestionButton({
    super.key,
    required this.title,
    required this.assets,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: isSelected ? Colors.orange : Colors.white.withOpacity(.10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSvg(asset: "assets/icons/$assets.svg"),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'DMSans',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
