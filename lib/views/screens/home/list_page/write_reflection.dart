import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/continue_button.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import '../../../base/custom_text_field.dart';

class WriteReflection extends StatelessWidget {
  const WriteReflection({super.key});

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
                    onTap: () {
                      Get.back();
                    },
                    child: CustomSvg(asset: "assets/icons/back.svg"),
                  ),
                  Image.asset("assets/images/logo.png", width: 98),
                  SizedBox(),
                ],
              ),
              SizedBox(height: 26.h),
              Text(
                "Refleksi Jiwa: Kehilangan Diri",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'DMSans',
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                "Karena menulis adalah cara jiwa bicara ke tubuh.\nTidak perlu sempurna. Tulis saja apa yang\ningin didengar Oleh hatimu.",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  color: AppColors.textGrey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                height: MediaQuery.of(context).size.height / 3,
                hintText:
                    'Tuliskan apapun yang muncul, tidak  ada yang salah...',
              ),
              SizedBox(height: 63.h),
              CustomContinueButton(
                title: " Save this reflection",
                onPress: () {},
              ),
              SizedBox(height: 21.h),
              CustomContinueButton(
                filledBackground: false,
                isBorderNeeded: true,
                title: " Kembali ke Spiral Journey",
                onPress: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
