import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      padding:  EdgeInsets.only(bottom: 18.w),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: isSelected ? Colors.orange : Colors.white.withOpacity(.10),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: 15.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomSvg(asset: "assets/icons/$assets.svg"),
                 SizedBox(width: 8.w),
                Text(
                  title,
                  style:  TextStyle(
                    fontSize: 18.sp,
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
