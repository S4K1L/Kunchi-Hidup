import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/continue_button.dart';
import 'package:kunci_hidup/views/base/custom_app_bar.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';

import '../../../base/custom_text_field.dart';

class AskWithIn extends StatelessWidget {
  final String appBarTitle;
  final String appBarAssets;
  final String appBarSubTitle;

  AskWithIn({
    super.key,
    required this.appBarTitle,
    required this.appBarSubTitle,
    required this.appBarAssets,
  });

  final List<String> titles = [
    'I feel anxious',
    "I'm overwhelmed",
    "I can't sleep",
    'I need clarity',
  ];

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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Column(
                children: [
                  Text(
                    "How are you feeling today?",
                    style: TextStyle(
                      fontSize: 46.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: AppColors.white,
                    ),
                    textAlign: TextAlign.center ,
                  ),
                  SizedBox(height: 11.h),
                  Stack(
                    children: [
                      TextFormField(
                        style: TextStyle(
                          color: AppColors.white
                        ),
                        decoration: InputDecoration(
                          hintText: 'Share your feelings',
                          filled: true,
                          fillColor: AppColors.white.withOpacity(.10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.r),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),

                      Positioned(
                        top: 0,
                        bottom: 0,
                        right: 0,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Container(
                            width: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: AppColors.primaryColor,
                              border: Border.all(color: AppColors.white.withOpacity(.40)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: CustomSvg(asset: "assets/icons/send.svg",height: 18,),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 11.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        titles.length,
                            (index) => Padding(
                          padding: EdgeInsets.only(right: 6.w),
                          child: buildFeeling(titles[index]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(),
            ],
          ),
        ),
      ],
    );
  }

  Container buildFeeling(String title) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(42.r),
        color: AppColors.white.withOpacity(.10),
        border: Border.all(color: AppColors.white.withOpacity(.10)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        child: Text(
          title,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'DMSans',
          ),
        ),
      ),
    );
  }
}
