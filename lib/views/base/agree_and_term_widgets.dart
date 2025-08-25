import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/screens/auth/privacy_and_policy.dart';

class AgreeTermsWidget extends StatelessWidget {
  const AgreeTermsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        children: [
          TextSpan(text: 'By continuing, you agree to ',style: TextStyle(color: Colors.white.withOpacity(.70),fontSize: 12,fontWeight: FontWeight.w500,fontFamily: "DMSans")),
          TextSpan(
            text: 'Privacy\nPolicy',
            style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600,fontFamily: "DMSans"),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(()=> PrivacyPolicyPage());
                print('Privacy Policy tapped');
              },
          ),
          TextSpan(text: ' and ',style: TextStyle(color: Colors.white.withOpacity(.70),fontSize: 12,fontWeight: FontWeight.w500,fontFamily: "DMSans")),
          TextSpan(
            text: 'Terms & Conditions',
            style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600,fontFamily: "DMSans"),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Get.to(()=> PrivacyPolicyPage());
                print('Terms & Conditions tapped');
              },
          ),
        ],
      ),
    );
  }
}
