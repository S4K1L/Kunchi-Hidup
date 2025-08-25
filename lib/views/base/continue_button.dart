import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_svg.dart';

class CustomContinueButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const CustomContinueButton({
    super.key, required this.title, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.primaryColor
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title,style: TextStyle(color:  Colors.black,fontSize: 18,fontWeight: FontWeight.w600, fontFamily: "DMSans"),)
            ],
          ),
        ),
      ),
    );
  }
}