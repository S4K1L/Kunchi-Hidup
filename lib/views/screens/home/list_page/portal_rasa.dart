import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/continue_button.dart';
import 'package:kunci_hidup/views/base/custom_app_bar.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';

import '../../../base/custom_text_field.dart';

class PortalRasa extends StatelessWidget {
  final String appBarTitle;
  final String appBarAssets;
  final String appBarSubTitle;

  PortalRasa({
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
        SizedBox(height: 32.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "How are you feeling today?",
                  style: TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'CormorantGaramond',
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(height: 11.h),
              CustomTextField(
                height: MediaQuery.of(context).size.height / 6,
                hintText: 'Write here',
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
              SizedBox(height: 28.h),
              CustomContinueButton(title: "Decode", onPress: () {}),
              SizedBox(height: 28.h),
              Divider(thickness: 1, color: Colors.grey.withOpacity(.20)),
              SizedBox(height: 19.h),
              Text(
                "Suggested",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSans',
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 11.h),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'I will give you best suggestion',
                  filled: true,
                  fillColor: AppColors.white.withOpacity(.10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.r),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.white.withOpacity(.10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.w,horizontal: 16.w),
                  child: Row(
                    children: [
                      CustomSvg(asset: "assets/icons/listening.svg",width: 20),
                      SizedBox(width: 20.w),
                      Text(
                        "Listening to your inner child",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DMSans',
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 14.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColors.white.withOpacity(.10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.w,horizontal: 16.w),
                  child: Row(
                    children: [
                      CustomSvg(asset: "assets/icons/homeOverwhelmed/ruang.svg",width: 25,height: 25,),
                      SizedBox(width: 20.w),
                      Text(
                        "Tell a Story From within",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'DMSans',
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
