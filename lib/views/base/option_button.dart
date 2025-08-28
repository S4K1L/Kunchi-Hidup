import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_svg.dart';

class OptionButton extends StatelessWidget {
  final String logoName;
  final String title;
  final bool isSelected;
  final VoidCallback? onPressed;

   const OptionButton({
    super.key,
    required this.logoName,
    required this.title,
    this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
    isSelected ? AppColors.primaryColor : Colors.white.withOpacity(0.10);

    final logoBgColor =
    isSelected ? Colors.black : AppColors.primaryColor;

    final logoColor = isSelected ? Colors.white : null;
    final textColor = isSelected ? Colors.black : Colors.white;

    return Padding(
      padding:  EdgeInsets.only(bottom: 12.w),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: backgroundColor,
          ),
          child: Row(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 5.w, horizontal: 6.w),
                child: Container(
                  width: 40.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: logoBgColor,
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(10.sp),
                    child: CustomSvg(
                      asset: 'assets/icons/$logoName.svg',
                      color: logoColor,
                    ),
                  ),
                ),
              ),
               SizedBox(width: 4.w),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSans',
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
