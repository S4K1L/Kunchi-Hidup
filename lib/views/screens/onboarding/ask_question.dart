import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import '../../base/bottom_circular_button.dart';
import 'human_info.dart';

class AskQuestion extends StatelessWidget {
   const AskQuestion({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomScaffold(
      isScrollable: true,
      hasTopGlow: false,
      hasBottomGlow: false,
      bottomBarChildren: [BottomCircularButton(onPress: () {
        Get.to(()=> HumanInformation());
      }, currentStep: 4)],
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Colors.white.withOpacity(.10)
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   SizedBox(height: 18.h),
                  Image.asset("assets/images/logo.png", width: 112.w),
                   SizedBox(height: 35.h),
                  Image.asset('assets/images/questionMark.png'),
                   Text(
                    "Please answer a few questions to adjust Kh to your needs.",
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "We’ll only use your answers to personalize experience your data is completely safe.",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Date Policy",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DMSans',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 25.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
