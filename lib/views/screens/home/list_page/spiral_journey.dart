import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/views/base/custom_app_bar.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import '../../../base/course_card.dart';
import 'course_card_details.dart';

class SpiralJourney extends StatelessWidget {
  final String appBarTitle;
  final String appBarAssets;
  final String appBarSubTitle;
  final String bodyTitle;
  final String bodySubTitle;
  const SpiralJourney({super.key, required this.appBarTitle, required this.appBarSubTitle, required this.bodyTitle, required this.bodySubTitle, required this.appBarAssets});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(82.h), // Height of AppBar
        child: CustomAppBar(
          assets: appBarAssets,
          title: appBarTitle,
          subTitle: appBarSubTitle,
        ),
      ),
      children: [
        Column(
          children: [
            SizedBox(height: 20.h),
            Text(
              bodyTitle,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'DMSans',
                color: AppColors.white,
              ),
            ),
            Text(
              bodySubTitle,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                fontFamily: 'DMSans',
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
            CourseCard(
              onPress: (){
                Get.to(()=>CourseCardDetails());
              },
              cardTitle: "Abundance Spiral",
              cardSubTitle:
                  "“When you want to receive more, but you're\nafraid to open. This spiral helps you align with\n worthiness and the flow of abundance.”",
              cardDuration: "1-7",
              cardFocus: "Self-worth, fear of receiving, overflow",
            ),
          ],
        ),
      ],
    );
  }
}

