import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/onboarding/question/question.dart';
import '../../base/bottom_circular_button.dart';

class HumanInformation extends StatelessWidget {
   const HumanInformation({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomScaffold(
      isScrollable: true,
      hasTopGlow: false,
      hasBottomGlow: false,
      bottomBarChildren: [BottomCircularButton(onPress: () {
        Get.to(()=> Question());
      }, currentStep: 5)],
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               SizedBox(height: 18.h),
              Image.asset("assets/images/logo.png", width: 112.w),
               SizedBox(height: 80.h),
              Image.asset('assets/images/humanInfo.png'),
               SizedBox(height: 80.h),
              Text(
                "Kami akan membaca pusat energi\ntubuhmu. Jawablah dengan jujur, agar kami bisa mendeteksi cakra yang sedang tertutup.",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
