import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/onboarding/play_audio.dart';

import '../../../utils/app_colors.dart';

class VoiceChakra extends StatelessWidget {
  const VoiceChakra({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasTopGlow: false,
      hasBottomGlow: false,
      isScrollable: true,
      children: [
        Column(
          children: [
            const SizedBox(height: 32),
            Image.asset("assets/images/logo.png", width: 112),
            const SizedBox(height: 66),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Text(
                    "Cakra yang paling tertutup saat ini:",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      color: AppColors.primaryColor.withOpacity(.10),
                      border: Border.all(color: AppColors.primaryColor)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 29,vertical: 38),
                      child: Column(
                        children: [
                          CustomSvg(asset: "assets/icons/microphone.svg"),
                          const SizedBox(height: 14),
                          Text(
                            "Chakra Tenggorokan",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'CormorantGaramond',
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Kami merasakan luka dalam suara batinmu. Kamu terbiasa diam... terlalu lama.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DMSans',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 66),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=> PlayAudio());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white.withOpacity(.10)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 22,vertical: 13),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 22,
                              backgroundColor: AppColors.primaryColor.withOpacity(.21),
                              child: Icon(Icons.play_arrow_rounded,color: AppColors.primaryColor,size: 27),
                            ),
                            const SizedBox(width: 11),
                            const Text(
                              "Dengarkan Pesan Penyembuhan",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'DMSans',
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
