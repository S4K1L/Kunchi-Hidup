import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/screens/home/home.dart';

class CustomAppBar extends StatelessWidget {
  final String assets;
  final String title;
  final String subTitle;
  const CustomAppBar({
    super.key, required this.assets, required this.title, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 126.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.r),
          bottomRight: Radius.circular(20.r),
        ),
        color: Color(0xDFF3F3F3).withOpacity(.10),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: CustomSvg(asset: "assets/icons/back.svg")),
            SizedBox(width: 10.w),
            CustomSvg(asset: "assets/icons/homeOverwhelmed/$assets.svg"),
            SizedBox(width: 10.w),
            // Title text
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'DMSans',
                    color: AppColors.primaryColor,
                    letterSpacing: -0.3,
                  ),
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'DMSans',
                    color: AppColors.white,
                    letterSpacing: -0.3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
