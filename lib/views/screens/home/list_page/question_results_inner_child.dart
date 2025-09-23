import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/question_result_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/custom_svg.dart';
import '../../../base/custom_scaffold.dart';
import 'package:kunci_hidup/models/question_model.dart';

class QuestionResultsInnerChild extends StatelessWidget {
  QuestionResultsInnerChild({super.key});
  final QuestionResultsController controller = Get.put(QuestionResultsController());

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useSafeArea: false,
      children: [
        customAppBar(context),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Obx(() {
            if (controller.results.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              children: controller.results.map((result) {
                return resultCard(result);
              }).toList(),
            );
          }),
        ),
      ],
    );
  }

  Padding resultCard(QuestionResultModel result) {
    return Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: AppColors.white.withOpacity(.10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          result.question,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                            fontFamily: 'CormorantGaramond',
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 6.h),
                        Row(
                          children: [
                            Text(
                              "Your Ans: ",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 14.sp,
                                fontFamily: 'CormorantGaramond',
                                color: AppColors.white,
                              ),
                            ),
                            if(result.answer == 'Yes')CustomSvg(asset: "assets/icons/tick.svg"),
                            if(result.answer == 'No')CustomSvg(asset: "assets/icons/cancel.svg"),
                            if(result.answer == 'Sometimes')CustomSvg(asset: "assets/icons/minus.svg"),
                            Text(
                              result.answer,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20.sp,
                                fontFamily: 'CormorantGaramond',
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
  }

  GestureDetector customAppBar(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          color: const Color(0xDFF3F3F3).withOpacity(.10),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSvg(asset: "assets/icons/back.svg"),
              Text(
                "Inner Child Spiral\n Completed",
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
      ),
    );
  }
}
