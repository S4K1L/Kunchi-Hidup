import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../base/bottom_circular_button.dart';
import 'about_kh.dart';

class OnboardingWelcomePage extends StatelessWidget {
  const OnboardingWelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset("assets/images/logo.png", width: 112.w),
              Image.asset(
                "assets/images/girlYoga.jpg",
                height: MediaQuery.of(context).size.height / 2.1,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 18.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to the\nSanctuary of soul sounds.",
                      style: TextStyle(
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'CormorantGaramond',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      "Where your feelings find a voice...\nand your silence finds understanding.",
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
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.w),
        child: BottomCircularButton(
          onPress: () {
            Get.to(() => AboutKH());
          },
          currentStep: 1,
        ),
      ),
    );
  }
}
