import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/onboarding/ask_question.dart';
import '../../base/bottom_circular_button.dart';
import '../../base/edge_blur_overlay.dart';
import '../../base/ios_dialog.dart';

class HelpUsHand extends StatefulWidget {
  const HelpUsHand({super.key});

  @override
  State<HelpUsHand> createState() => _HelpUsHandState();
}

class _HelpUsHandState extends State<HelpUsHand> {
  @override
  void initState() {
    super.initState();
    // Show dialog after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showTrackingPermissionDialog(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: true,
      hasTopGlow: false,
      hasBottomGlow: false,
      bottomBarChildren: [
        BottomCircularButton(
          onPress: () {
            Get.to(() => AskQuestion());
          },
          currentStep: 3,
        )
      ],
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 32),
            Image.asset("assets/images/logo.png", width: 112),
            const SizedBox(height: 35),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  'assets/images/handShake.png',
                  fit: BoxFit.contain,
                ),
                const Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: EdgeBlurOverlay(align: Alignment.centerLeft),
                ),
                const Positioned(
                  top: 0,
                  right: 0,
                  bottom: 0,
                  child: EdgeBlurOverlay(align: Alignment.centerRight, isReversed: true),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Help us to help others",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "With your help, we can reach the right people through ads and help them stay focused.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
