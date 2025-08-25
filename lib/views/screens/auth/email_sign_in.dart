import 'dart:ui';
import 'package:flutter/material.dart';
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
          height: MediaQuery.of(context).size.height / 2.5,
        ),
        Image.asset(
          "assets/images/logo.png",
          height: 57,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(height: 20),
              Text(
                "Sign in with email",
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
                "Please enter your email to proceed",
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
                  "Email",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    fontFamily: "DMSans",
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Email TextField with controller
              Obx(() => TextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  fillColor: Colors.white.withOpacity(.10),
                  filled: true,
                  labelStyle: TextStyle(color: Colors.white),
                  hintText: "Email",
                  hintStyle: TextStyle(
                      color: Colors.white.withOpacity(.30),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: "DMSans"),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  errorText: controller.emailError.value.isEmpty
                      ? null
                      : controller.emailError.value,
                ),
              )),
              SizedBox(height: 26),

              // Continue Button with validation on press
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
        CustomSvg(asset: assets, height: 20, width: 20),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontFamily: 'DMSans',
            fontWeight: FontWeight.w500,
            letterSpacing: -0.3,
          ),
        ),
      ],
    );
  }
}