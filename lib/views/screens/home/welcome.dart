import 'package:flutter/material.dart';
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
      children: [
        Image.asset(
          "assets/images/chakraYoga.jpg",
          height: 380,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 48),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Image.asset("assets/images/logo.png", width: 125, fit: BoxFit.cover),
              SizedBox(height: 68),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w700,
                  fontFamily: "CormorantGaramond",
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 18),
              Text(
                "Your path to discover patterns within\nbegins here. Let’s take a quick look at how\nit works.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: "DMSans",
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 68),
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
