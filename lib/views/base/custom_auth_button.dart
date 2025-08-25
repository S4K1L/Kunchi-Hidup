import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_svg.dart';

class CustomAuthButton extends StatelessWidget {
  final String logo;
  final String title;
  final VoidCallback onPress;
  const CustomAuthButton({
    super.key, required this.logo, required this.title, required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: AppColors.buttonColor
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.sp),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              logo.isNotEmpty ?
              CustomSvg(asset: logo,height: 24.h,width: 24.w,) : SizedBox(),
              SizedBox(width: 8.w),
              Text(title,style: TextStyle(color: Colors.white,fontSize: 16.sp,fontWeight: FontWeight.w600, fontFamily: "DMSans"),)
            ],
          ),
        ),
      ),
    );
  }
}