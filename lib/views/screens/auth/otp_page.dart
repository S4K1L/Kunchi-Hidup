import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/auth/confirm.dart';
import '../../../utils/custom_svg.dart';
import '../../base/continue_button.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  int _start = 30;
  late Timer _timer;

  final List<TextEditingController> _otpControllers =
  List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_start == 0) {
        timer.cancel();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  void resendEmail() {
    setState(() {
      _start = 30;
    });
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    _focusNodes.forEach((f) => f.dispose());
    super.dispose();
  }

  void _moveFocus(int index) {
    if (index < 5) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }
  }

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
          height: 230.h,
        ),
        SizedBox(height: 12.h),
        Image.asset(
          "assets/images/logo.png",
          height: 57.h,
        ),
        SizedBox(height: 12.h),
        CustomSvg(asset: 'assets/icons/colorSms.svg', width: 64.w),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              Text(
                "Confirm Your Email",
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
                "Check your inbox tap the magic link or paste the\nsign-in code from the email.",
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
                  "Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: "DMSans",
                  ),
                ),
              ),
              SizedBox(height: 10.h),

              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return Container(
                    width: 48.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white.withOpacity(.10),
                    ),
                    child: TextField(
                      controller: _otpControllers[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      focusNode: _focusNodes[index],
                      onChanged: (value) {
                        if (value.isNotEmpty) _moveFocus(index);
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 10.h),

              // Timer and Resend Email
              Column(
                children: [
                  Text(
                    '0:${_start.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DMSans',
                    ),
                  ),
                  SizedBox(height: 8.h),
                  GestureDetector(
                    onTap: resendEmail,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.refresh, color: AppColors.primaryColor, size: 20.r),
                        Text(
                          ' Resend Email',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DMSans',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 26.h),

              // Continue Button
              CustomContinueButton(
                onPress: () {
                  Get.to(() => ConfirmPage());
                },
                title: 'Continue',
              ),
            ],
          ),
        ),
        SizedBox(height: 12.h),
      ],
    );
  }
}
