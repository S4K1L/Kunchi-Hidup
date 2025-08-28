import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class CustomContinueButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool? filledBackground;
  final bool? isBorderNeeded;
  const CustomContinueButton({
    super.key,
    required this.title,
    required this.onPress,
    this.filledBackground = true,
    this.isBorderNeeded = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: filledBackground == true
              ? AppColors.primaryColor
              : Colors.transparent,
          border: Border.all(
            color: isBorderNeeded == true
                ? AppColors.primaryColor
                : Colors.transparent,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: isBorderNeeded == true
                      ? AppColors.primaryColor
                      : AppColors.black,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: "DMSans",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
