import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/continue_button.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/onboarding/welcome.dart';
import '../../../utils/custom_svg.dart';
import '../../base/agree_and_term_widgets.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasBottomGlow: false,
      useSafeArea: false,
      children: [
        Image.asset(
          "assets/images/loginYoga.png",
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.height / 2.5,
        ),
        Spacer(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png", height: 57.h),
              SizedBox(height: 52.h),
              Text(
                "Hello, Jhon",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33.sp,
                  fontFamily: 'CormorantGaramond',
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 18.h),
              AgreeTermsWidget(),
              SizedBox(height: 18.h),
              Text(
                "User ID: 9858 - 2852 - 5858 - 25812",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 52.h),
              CustomContinueButton(
                title: "Continue",
                onPress: () {
                  Get.to(() => WelcomePage());
                },
              ),
            ],
          ),
        ),
        Spacer(),
      ],
    );
  }

  Row deviceRow(String assets, String text) {
    return Row(
      children: [
        CustomSvg(asset: assets, height: 20.h, width: 20.h),
        SizedBox(width: 4.w),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontFamily: 'DMSans',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }
}
