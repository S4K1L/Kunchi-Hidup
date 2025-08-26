import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/continue_button.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/home/music_player.dart';

import 'write_reflection.dart';

class CourseCardDetails extends StatelessWidget {
  const CourseCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                      child: CustomSvg(asset: "assets/icons/back.svg")),
                  Image.asset("assets/images/logo.png", width: 98),
                  SizedBox(),
                ],
              ),
              SizedBox(height: 26.h),
              Text(
                "Day 1",
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'DMSans',
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 24.h),
              Text(
                "Collective Karma Spiral",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'DMSans',
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                '"Rasa takut kehilangan dirimu sendiri\nadalah sinyal bahwa jiwamu sedang merindukan rumah di dalam tubuhmu sendiri. Kamu tidak hilang kamu hanya belum didengar."',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 28.h),
              GestureDetector(
                onTap: () {
                  Get.to(()=> MusicPlayer(audioLink: "assets/audio/sample.mp3", title: "Grief Ritual - Breathe Into Loss"));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.white.withOpacity(.10),
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(.24),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 8,
                    ),
                    child: Row(
                      children: [
                        CustomSvg(asset: "assets/icons/speaker.svg"),
                        SizedBox(width: 11.h),
                        Text(
                          "Dengarkan Pesan Penyembuhan",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'DMSans',
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: AppColors.white.withOpacity(.10),
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(.24),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.sp,vertical: 22.w),
                    child: Column(
                      children: [
                        Text(
                          "Journal Prompt",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'DMSans',
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 17.h),
                        Text(
                          "Kapan terakhir kali kamu merasa\nseperti 'bukan dirimu sendiri'? Apa\nbagian yang ingin kamu peluk kembali\nhari ini?",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'DMSans',
                            color: AppColors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 29.h),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 28.h),
              CustomContinueButton(title: "Tulis Refleksi", onPress: (){
                Get.to(()=>WriteReflection());
              })
            ],
          ),
        ),
      ],
    );
  }
}
