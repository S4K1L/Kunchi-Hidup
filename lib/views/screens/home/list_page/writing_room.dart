import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/continue_button.dart';
import 'package:kunci_hidup/views/base/custom_app_bar.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/home/list_page/writing_field.dart';

class WritingRoom extends StatelessWidget {
  final String appBarTitle;
  final String appBarAssets;
  final String appBarSubTitle;

  const WritingRoom({
    super.key,
    required this.appBarTitle,
    required this.appBarSubTitle,
    required this.appBarAssets,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(82.h),
        child: CustomAppBar(
          assets: appBarAssets,
          title: appBarTitle,
          subTitle: appBarSubTitle,
        ),
      ),
      children: [
        Expanded(
          child: Center( // 👈 ensures logo + text are centered vertically
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomSvg(asset: "assets/icons/bookWriting.svg"),
                  SizedBox(height: 40.h),
                  Text(
                    "Journal Refleksi",
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "A safe space to write, guided by prompts",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DMSans',
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),

        // 👇 stays fixed at bottom
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 20),
          child: CustomContinueButton(
            title: "Write from Within",
            onPress: () {
              Get.to(()=> WritingField());
            },
          ),
        ),
      ],
    );
  }
}
