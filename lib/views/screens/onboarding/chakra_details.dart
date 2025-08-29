import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/continue_button.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/onboarding/voice_chakra.dart';

import '../../../utils/app_colors.dart';

class ChakraDetails extends StatelessWidget {
   const ChakraDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: true,
      hasTopGlow: false,
      hasBottomGlow: false,
      bottomBarChildren: [CustomContinueButton(title: "Continue", onPress: (){
        Get.to(()=> VoiceChakra());

      })],
      children: [
        Column(
          children: [
             SizedBox(height: 32.h),
            Image.asset("assets/images/logo.png", width: 112.w),
             SizedBox(height: 50.h),
            Image.asset("assets/images/chakraIcon.png",fit: BoxFit.cover,),
             SizedBox(height: 50.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Text(
                    "Energi Terdalammu\nAkan Terbaca",
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(height: 36.h),
                   Text(
                    "Setiap jawabanmu tadi bukan sekadar pilihan tapi adalah cermin dari energi, luka, dan pusat kekuatanmu saat ini. Kami sedang membaca gelombang jiwa... dan menemukan pintu pulangmu.",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'DMSans',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
