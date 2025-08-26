import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_svg.dart';

class CourseCard extends StatelessWidget {
  final String cardTitle;
  final String cardSubTitle;
  final String cardDuration;
  final String cardFocus;
  final VoidCallback onPress;

  const CourseCard({
    super.key,
    required this.cardTitle,
    required this.cardSubTitle,
    required this.cardDuration,
    required this.cardFocus, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 8.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.sp),
          color: Colors.white12.withOpacity(.10),
          border: Border.all(color: AppColors.white.withOpacity(.30)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 27),
          child: Column(
            children: [
              Text(
                cardTitle,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryColor,
                  fontFamily: 'DMSans',
                ),
              ),
              Text(
                cardSubTitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textWhite,
                  fontFamily: 'DMSans',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSvg(asset: "assets/icons/calender.svg", height: 15.h),
                  SizedBox(width: 4.h),
                  Text(
                    "Duration: $cardDuration Days",
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'DMSans',
                      color: AppColors.textGrey,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Focus: ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryColor,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  Text(
                    cardFocus,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryColor,
                      fontFamily: 'DMSans',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              TextButton(
                onPressed: onPress,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 48.w,
                      vertical: 8.w,
                    ),
                    child: Text(
                      "Start This Spiral",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.black,
                        fontFamily: 'DMSans',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
