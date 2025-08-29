import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/models/journal_model.dart';
import '../../../../controllers/journal_controller.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/custom_svg.dart';
import '../../../base/custom_scaffold.dart';
import 'journal_details.dart';

class JournalList extends StatelessWidget {
  const JournalList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(JournalController());
    controller.fetchJournals();

    return CustomScaffold(
      useSafeArea: false,
      children: [
        customAppBar(context),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }
            if (controller.journals.isEmpty) {
              return const Center(child: Text("No journals found"));
            }

            return Column(
              children: controller.journals.map((journal) {
                return GestureDetector(
                  onTap: () {
                    Get.to(() => JournalDetails(journal: journal));
                  },
                  child: resultCard(journal),
                );
              }).toList(),
            );
          }),
        ),
      ],
    );
  }

  Padding resultCard(JournalModel journal) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.white.withOpacity(.10),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                journal.title,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'DMSans',
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                journal.description,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  fontFamily: 'DMSans',
                  color: AppColors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: false,
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "${journal.createdAt.day} ${_monthName(journal.createdAt.month)}, ${journal.createdAt.year}",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                    fontFamily: 'DMSans',
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // simple month helper
  String _monthName(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Get.back(),
              child: CustomSvg(asset: "assets/icons/back.svg"),
            ),
            Text(
              "12 Days of Journaling",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'DMSans',
                color: AppColors.primaryColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
