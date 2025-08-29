import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/auth/other_sign_in_option.dart';
import 'package:kunci_hidup/views/screens/home/home.dart';
import '../../../utils/custom_svg.dart';
import '../../base/agree_and_term_widgets.dart';
import '../../base/custom_auth_button.dart';
import '../../base/or_text_widgets.dart';

class SignInOption extends StatelessWidget {
  const SignInOption({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasBottomGlow: false,
      useSafeArea: false,
      isScrollable: true,
      children: [
        Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/loginYoga.png",
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height / 2.8,
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Image.asset(
                    "assets/images/logo.png",
                    height: 57.h,
                    width: 121.h,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20.h),
                  Text(
                    "Set Up Account to Save\nYour Progress",
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
                    "Sign in or register to use your Kunci Hidup\ncollection on an unlimited number of devices.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
                      fontFamily: 'DMSans',
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      deviceRow('assets/icons/mobile.svg', "Mobile"),
                      deviceRow('assets/icons/monitor.svg', "Desktop"),
                      deviceRow('assets/icons/clock.svg', "Wearable"),
                      deviceRow('assets/icons/headphone.svg', "Voice"),
                    ],
                  ),
                  SizedBox(height: 25.h),
                  CustomAuthButton(
                    onPress: () {},
                    logo: 'assets/icons/apple.svg',
                    title: 'Sign in with Apple',
                  ),
                  SizedBox(height: 10.h),
                  CustomAuthButton(
                    onPress: () {
                      Get.to(() => OtherSignInOption());
                    },
                    logo: '',
                    title: 'Other Sign-in Options',
                  ),
                  SizedBox(height: 12.h),
                  AgreeTermsWidget(),
                  SizedBox(height: 12.h),
                  OrSeparatorWidget(),
                  SizedBox(height: 12.h),
                  CustomAuthButton(
                    onPress: () {
                      Get.offAll(() => HomePage());
                    },
                    logo: '',
                    title: 'Login as Guest ',
                  ),
                  SizedBox(height: 12.h),
                ],
              ),
            ),
          ],
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
