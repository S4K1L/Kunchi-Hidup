import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/controllers/auth_controller.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/auth/otp_page.dart';
import '../../../utils/custom_svg.dart';
import '../../base/continue_button.dart';

class EmailSignIn extends StatelessWidget {
  EmailSignIn({super.key});
  final AuthController controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasBottomGlow: false,
      useSafeArea: false,
      isScrollable: true,
      children: [
        Image.asset(
          "assets/images/loginYoga.png",
          fit: BoxFit.cover,
          height: 250.h,
        ),
        SizedBox(height: 20.h),
        Image.asset(
          "assets/images/logo.png",
          height: 57.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 20.h),
              Text(
                "Sign in with email",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28.sp,
                  fontFamily: 'CormorantGaramond',
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),
              Text(
                "Please enter your email to proceed",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 26.h),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "DMSans",
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              // Email TextField with controller
              Obx(() => TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white, fontSize: 14.sp),
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(.10),
                  filled: true,
                  hintText: "Email",
                  hintStyle: TextStyle(
                    color: Colors.white.withOpacity(.30),
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "DMSans",
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                  errorText: controller.emailError.value.isEmpty
                      ? null
                      : controller.emailError.value,
                ),
              )),
              SizedBox(height: 26.h),

              // Continue Button with validation
              CustomContinueButton(
                onPress: () {
                  if (controller.validateEmail()) {
                    Get.to(() => OtpPage());
                  }
                },
                title: 'Continue',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Row deviceRow(String assets, String text) {
    return Row(
      children: [
        CustomSvg(asset: assets, height: 20.h, width: 20.w),
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
