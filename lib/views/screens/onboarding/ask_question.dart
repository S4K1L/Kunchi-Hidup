import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import '../../base/bottom_circular_button.dart';
import 'human_info.dart';

class AskQuestion extends StatelessWidget {
  const AskQuestion({super.key});

  @override
  Widget build(BuildContext context) {

    return CustomScaffold(
      isScrollable: true,
      hasTopGlow: false,
      hasBottomGlow: false,
      bottomBarChildren: [BottomCircularButton(onPress: () {
        Get.to(()=> HumanInformation());
      }, currentStep: 4)],
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white.withOpacity(.10)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 18),
                  Image.asset("assets/images/logo.png", width: 112),
                  const SizedBox(height: 35),
                  Image.asset('assets/images/questionMark.png'),
                  const Text(
                    "Please answer a few questions to adjust Kh to your needs.",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "We’ll only use your answers to personalize experience your data is completely safe.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Date Policy",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DMSans',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
