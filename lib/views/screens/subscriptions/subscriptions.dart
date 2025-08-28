import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';

import '../../../utils/app_colors.dart';
import '../../base/custom_scaffold.dart';
import '../../base/ios_dialog.dart';

class SubscriptionsPage extends StatelessWidget {
   SubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(82.h),
        child: Container(
          height: 126.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r),
            ),
            color: Color(0xDFF3F3F3).withOpacity(.10),
          ),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title text
                Text(
                  "Privacy Policy for Kunci Hidup App",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'DMSans',
                    color: Colors.white,
                    letterSpacing: -0.3,
                  ),
                ),
                // Close button
                IconButton(
                  icon: Icon(Icons.highlight_remove, color: Colors.white),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      children: [
        SizedBox(height: 30.h),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22.r),
              color: AppColors.primaryColor.withOpacity(.10),
            ),
            child: Padding(
              padding:  EdgeInsets.only(left: 12.sp,right: 12.sp, top: 18.sp),
              child: Column(
                children: [
                  CustomSvg(asset: "assets/icons/lock.svg", width: 50.w),
                  SizedBox(height: 12.h),
                  Text(
                    "Beri Hadiah untuk\nDiri Otentikmu",
                    style: TextStyle(
                      fontSize: 30.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Akses semua spiral, audio\npenyembuhan, pembacaan chakra,\ndan peta jiwa pribadi.",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.h),
                  markWithText(
                    "orangeTick",
                    "Pembacaan chakra + audio penyembuhan",
                  ),
                  markWithText(
                    "orangeTick",
                    "Spiral harian & jurnal reflektif",
                  ),
                  markWithText(
                    "orangeTick",
                    "Decoder jiwa untuk trauma & identitas",
                  ),
                  markWithText(
                    "orangeTick",
                    "Audio visualisasi & afirmasi terpandu",
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "Your Healing Journey Awaits",
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "No pressure, cancel anytime.\nBegin for free, stay only if it feels right.",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DMSans',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40.h),
                  GestureDetector(
                    onTap: (){
                      showPurchaseSuccessDialog(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(14.r),
                          topRight: Radius.circular(14.r),
                        ),
                        color: AppColors.primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryColor.withOpacity(0.6),
                            blurRadius: 20,
                            spreadRadius: 3,
                            offset:  Offset(0, 4),
                          ),
                        ],
                      ),
                      child:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.h, vertical: 10.w),
                        child: Column(
                          children: [
                            Text(
                              "Start Free for 10 Days",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'DMSans',
                              ),
                            ),
                            Text(
                              "Then Rp161000/month",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'DMSans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }

  Padding markWithText(String assets, String title) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 10.w),
      child: Row(
        children: [
          CustomSvg(asset: "assets/icons/$assets.svg", width: 22.sp),
          SizedBox(width: 6.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: "DMSans",
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Column informationField(String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              fontFamily: 'CormorantGaramond',
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          description,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'DMSans',
            color: Colors.white,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
