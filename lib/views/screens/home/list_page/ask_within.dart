import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/custom_app_bar.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import '../../../../controllers/ask_within_controller.dart';

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

  final AskWithInController controller = Get.put(AskWithInController());

  final List<String> titles = [
    'I feel anxious',
    "I'm overwhelmed",
    "I can't sleep",
    'I need clarity',
  ];

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
        Obx(() {
          if (controller.messages.isEmpty) {
            // Centered view when no conversation
            return Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "How are you feeling today?",
                        style: TextStyle(
                          fontSize: 46.sp,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'CormorantGaramond',
                          color: AppColors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 21.h),
                      Stack(
                        children: [
                          TextFormField(
                            controller: controller.textController,
                            style: TextStyle(color: AppColors.white),
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
                              child: GestureDetector(
                                onTap: controller.sendMessage,
                                child: Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.r),
                                    color: AppColors.primaryColor,
                                    border: Border.all(
                                      color: AppColors.white.withOpacity(.40),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                                    child: CustomSvg(
                                      asset: "assets/icons/send.svg",
                                      height: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 21.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            titles.length,
                                (index) => Padding(
                              padding: EdgeInsets.only(right: 6.w),
                              child: GestureDetector(
                                onTap: () => controller.sendQuickMessage(titles[index]),
                                child: buildFeeling(titles[index]),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            // Chat view when conversation started
            return Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Text(
                      "How are you feeling today?",
                      style: TextStyle(
                        fontSize: 46.sp,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'CormorantGaramond',
                        color: AppColors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      padding: EdgeInsets.all(16.sp),
                      itemCount: controller.messages.length,
                      itemBuilder: (context, index) {
                        final msg = controller.messages[
                        controller.messages.length - 1 - index];
                        final isUser = msg['role'] == 'user';

                        return Align(
                          alignment:
                          isUser ? Alignment.centerRight : Alignment.centerLeft,
                          child: Padding(
                            padding: isUser
                                ? EdgeInsets.only(left: 22.w)
                                : EdgeInsets.only(right: 22.w),
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 6.h),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: isUser
                                    ? AppColors.primaryColor
                                    : AppColors.white.withOpacity(.10),
                                borderRadius: isUser
                                    ? BorderRadius.only(
                                  topLeft: Radius.circular(18.r),
                                  topRight: Radius.circular(18.r),
                                  bottomLeft: Radius.circular(18.r),
                                )
                                    : BorderRadius.only(
                                  bottomRight: Radius.circular(18.r),
                                  topRight: Radius.circular(18.r),
                                  bottomLeft: Radius.circular(18.r),
                                ),
                              ),
                              child: Text(
                                msg['text'] ?? '',
                                style: TextStyle(
                                  color: isUser
                                      ? AppColors.black.withOpacity(.80)
                                      : AppColors.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'DMSans',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Stack(
                      children: [
                        TextFormField(
                          controller: controller.textController,
                          style: TextStyle(color: AppColors.white),
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
                            child: GestureDetector(
                              onTap: controller.sendMessage,
                              child: Container(
                                width: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: AppColors.primaryColor,
                                  border: Border.all(
                                    color: AppColors.white.withOpacity(.40),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                                  child: CustomSvg(
                                    asset: "assets/icons/send.svg",
                                    height: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                ],
              ),
            );
          }
        }),
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
