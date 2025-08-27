import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/screens/home/list_page/question_results_inner_child.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/custom_svg.dart';
import '../../../base/custom_scaffold.dart';
import 'journal_list.dart';
import 'voice_sanctuary.dart';

class MonthlyMirror extends StatelessWidget {
  const MonthlyMirror({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useSafeArea: false,
      children: [
        Container(
          height: MediaQuery.of(context).size.height / 2.2,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
              bottomLeft: Radius.circular(22.r),
              bottomRight: Radius.circular(22.r),
            ),
            color: const Color(0xDFF3F3F3).withOpacity(.10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CustomSvg(asset: "assets/icons/back.svg"),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 26.sp),
                child: Image.asset(
                  "assets/images/logo.png",
                  height: 60.h,
                  width: 128.w,
                ),
              ),
              CustomSvg(asset: "assets/icons/man.svg"),
              SizedBox(height: 20.h),
              Text(
                "Monthly Mirror",
                style: TextStyle(
                  fontSize: 36.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'CormorantGaramond',
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              customButton("child", "Inner Child Spiral Completed", () {
                Get.to(()=> QuestionResultsInnerChild());

              }),
              customButton("child", "18 X Voice Sanctuary Moments", () {
                Get.to(()=> VoiceSanctuary());
              }),
              customButton("child", "12 Days of Journaling", () {
                Get.to(()=> JournalList());
              }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 26.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildFeeling('Loneliness'),
                    buildFeeling('Abandonment'),
                    buildFeeling('Abandonment'),
                  ],
                ),
              ),
              Text(
                "You stayed with yourself in sadness",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSans',
                  color: AppColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding customButton(String assets, String text, VoidCallback onPress) {
    return Padding(
      padding: EdgeInsets.only(bottom: 14.w),
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.white.withOpacity(.10),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 12.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomSvg(asset: "assets/icons/$assets.svg"),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'DMSans',
                    color: AppColors.white,
                  ),
                ),
                Spacer(),
                Icon(Icons.arrow_forward_ios, color: AppColors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildFeeling(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(42.r),
        color: AppColors.primaryColor.withOpacity(.10),
        border: Border.all(color: AppColors.primaryColor.withOpacity(.60)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.white.withOpacity(.80),
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'DMSans',
          ),
        ),
      ),
    );
  }
}
