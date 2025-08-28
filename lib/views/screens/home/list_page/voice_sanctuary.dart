import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/screens/home/music_player.dart';
import '../../../../controllers/question_result_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/custom_svg.dart';
import '../../../base/custom_scaffold.dart';

class VoiceSanctuary extends StatelessWidget {
  const VoiceSanctuary({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QuestionResultsController());
    controller.fetchResults();

    return CustomScaffold(
      useSafeArea: false,
      children: [
        customAppBar(context),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: resultCard(),
        ),
      ],
    );
  }

  Padding resultCard() {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.white.withOpacity(.10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primaryColor.withOpacity(.21),
                child: Center(
                  child: Icon(
                    Icons.play_arrow,
                    color: AppColors.primaryColor,
                    size: 30.sp,
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => MusicPlayer(
                        audioLink: "assets/audio/simple.mp3",
                        title: "Grief Ritual - Breathe Into Loss",
                      ),
                    );
                  },
                  child: Text(
                    "Dengarkan Pesan Penyembuhan dfgsdahkjfgdsahkha",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      fontFamily: 'DMSans',
                      color: AppColors.white,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container customAppBar(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 7,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.r),
        color: const Color(0xDFF3F3F3).withOpacity(.10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: CustomSvg(asset: "assets/icons/back.svg"),
            ),
            Text(
              "18 X Voice Sanctuary\n Moments",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'DMSans',
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(),
          ],
        ),
      ),
    );
  }
}
