import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
             SizedBox(height: 32.h),
            Image.asset("assets/images/logo.png", width: 112.w),
             SizedBox(height: 66.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                children: [
                  Text(
                    "Cakra yang paling tertutup saat ini:",
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(height: 24.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      color: AppColors.primaryColor.withOpacity(.10),
                      border: Border.all(color: AppColors.primaryColor)
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 29.w,vertical: 38.w),
                      child: Column(
                        children: [
                          CustomSvg(asset: "assets/icons/microphone.svg"),
                           SizedBox(height: 14.h),
                          Text(
                            "Chakra Tenggorokan",
                            style: TextStyle(
                              fontSize: 30.sp,
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
                   SizedBox(height: 24.h),
                   Text(
                    "Kami merasakan luka dalam suara batinmu. Kamu terbiasa diam... terlalu lama.",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DMSans',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                   SizedBox(height: 66.h),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=> PlayAudio());
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Colors.white.withOpacity(.10)
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 22.w,vertical: 13.w),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 22.r,
                              backgroundColor: AppColors.primaryColor.withOpacity(.21),
                              child: Icon(Icons.play_arrow_rounded,color: AppColors.primaryColor,size: 27.sp),
                            ),
                             SizedBox(width: 11.w),
                             Text(
                              "Dengarkan Pesan Penyembuhan",
                              style: TextStyle(
                                fontSize: 16.sp,
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
