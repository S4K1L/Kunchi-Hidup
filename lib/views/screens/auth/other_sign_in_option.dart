import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import '../../../utils/custom_svg.dart';
import '../../base/agree_and_term_widgets.dart';
import '../../base/custom_auth_button.dart';
import 'email_sign_in.dart';

class OtherSignInOption extends StatelessWidget {
  const OtherSignInOption({super.key});

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
          height: MediaQuery.of(context).size.height/2.5,
        ),
        Image.asset(
          "assets/images/logo.png",
          height: 57,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Text(
                "Kunci Hidup Account",
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
                "With kunci hidup account, you can enjoy your subscription on multiple devices.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
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
              SizedBox(height: 25),
              CustomAuthButton(
                onPress: (){},
                logo: 'assets/icons/apple.svg',
                title: 'Sign in with Apple',
              ),
              SizedBox(height: 10),
              CustomAuthButton(
                  onPress: (){},
                  logo: 'assets/icons/facebook.svg', title: 'Sign in with Facebook'),
              SizedBox(height: 10),
              CustomAuthButton(
                  onPress: (){
                    Get.to(()=> EmailSignIn());
                  },
                  logo: 'assets/icons/sms.svg', title: 'Sign in with Email'),
              SizedBox(height: 12),
              AgreeTermsWidget(),
              SizedBox(height: 12),
            ],
          ),
        )
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