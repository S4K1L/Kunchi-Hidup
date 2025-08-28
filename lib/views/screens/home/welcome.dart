import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/continue_button.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/home/home.dart';

class WelcomePage extends StatelessWidget {
   const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasBottomGlow: false,
      hasTopGlow: false,
      useSafeArea: false,
      isScrollable: true,
      children: [
        Image.asset(
          "assets/images/chakraYoga.jpg",
          height: 380.h,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 20.h),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png", width: 125.w, fit: BoxFit.cover),
              SizedBox(height: 68.h),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 42.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: "CormorantGaramond",
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Your path to discover patterns within\nbegins here. Let’s take a quick look at how\nit works.",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: "DMSans",
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.h),
              CustomContinueButton(title: "Mulai", onPress: (){
                Get.to(()=> HomePage());
              })
            ],
          ),
        ),
      ],
    );
  }
}
