import 'dart:async';
import 'package:flutter/material.dart';
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
  // Timer variable
  int _start = 30;
  late Timer _timer;

  // TextEditingController for OTP fields
  final List<TextEditingController> _otpControllers = List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  // Start the countdown timer
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (_start == 0) {
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  // Resend email functionality
  void resendEmail() {
    setState(() {
      _start = 30;
    });
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    startTimer(); // Start the timer when the page is initialized
  }

  @override
  void dispose() {
    _timer.cancel();
    _focusNodes.forEach((focusNode) => focusNode.dispose());
    super.dispose();
  }

  // Move focus to next field
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
          height: MediaQuery.of(context).size.height / 2.7,
        ),
        Image.asset(
          "assets/images/logo.png",
          height: 57,
        ),
        SizedBox(height: 12,),
        CustomSvg(asset: 'assets/icons/colorSms.svg', width: 64),
        SizedBox(height: 12,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Text(
                "Confirm Your Email",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'CormorantGaramond',
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                "Check your inbox tap the magic link or paste the\nsign-in code from the email.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 26),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Code",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "DMSans",
                  ),
                ),
              ),
              SizedBox(height: 10),

              // OTP Input Fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(.10)
                    ),
                    child: TextField(
                      controller: _otpControllers[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      keyboardType: TextInputType.number,
                      maxLength: 1,
                      focusNode: _focusNodes[index],
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          _moveFocus(index);  // Move focus to the next field
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        counterText: '',
                        hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                      ),
                    ),
                  );
                }),
              ),

              SizedBox(height: 10),
              // Timer and Resend Email
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '0:$_start',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans'
                    ),
                  ),
                  SizedBox(width: 5),
                  GestureDetector(
                    onTap: resendEmail,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.refresh,color: AppColors.primaryColor,size: 20),
                        Text(
                          ' Resend Email',
                          style: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'DMSans'
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: 26),
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
        SizedBox(height: 12,),
      ],
    );
  }
}
