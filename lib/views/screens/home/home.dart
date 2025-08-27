import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/home/list_page/ask_within.dart';
import 'package:kunci_hidup/views/screens/home/list_page/portal_rasa.dart';
import 'package:kunci_hidup/views/screens/home/list_page/writing_room.dart';
import '../../base/category_button.dart';
import '../../base/list_card_widgets.dart';
import '../auth/privacy_and_policy.dart';
import '../auth/sign_in_option.dart';
import '../subscriptions/subscriptions.dart';
import 'list_page/monthly_mirror.dart';
import 'list_page/spiral_journey.dart';
import 'monthly_reflection.dart';
import 'music_player.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final bool isExpire = false;

  @override
  Widget build(BuildContext context) {
    // Two lists: one for icons, one for titles
    final List<String> assets = [
      'anxious',
      'overwhelmed',
      'cantSleep',
      'needClarity',
      'study',
      'relax',
    ];
    final List<String> titles = [
      'Feel anxious',
      'Overwhelmed',
      'Can’t sleep',
      'Need clarity',
      'Study',
      'Relax',
    ];
    final List<Map<String, String>> cardData = [
      // Fixed ones
      {
        "assets": "spiral",
        "title": "Spiral Journey",
        "subTitle": "Start Your Spiral Journey",
      },
      {
        "assets": "portal",
        "title": "Portal Rasa",
        "subTitle": "Your Emotional Companion",
      },
      {
        "assets": "ask",
        "title": "Ask Within",
        "subTitle": "Portal to your patterns",
      },
      {
        "assets": "ruang",
        "title": "Ruang Menulis",
        "subTitle": "Writing Space",
      },
      {
        "assets": "mirror",
        "title": "Monthly Mirror",
        "subTitle": "Journey Result",
      },
    ];

    return CustomScaffold(
      isScrollable: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Builder(
                    builder: (context) => GestureDetector(
                      onTap: () {
                        showMenu(
                          context: context,
                          position: RelativeRect.fromLTRB(10, 80, 10, 0),
                          // position of menu
                          items: [
                            PopupMenuItem(
                              child: Text(
                                "Privacy Policy",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'DMSans',
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              onTap: () {
                                Get.to(()=> PrivacyPolicyPage());
                              },
                            ),
                            PopupMenuItem(
                              child: Text("General Terms",style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'DMSans',
                                color: AppColors.primaryColor,
                              ),),
                              onTap: () {
                                Get.to(()=> SubscriptionsPage());

                              },
                            ),
                            PopupMenuItem(
                              child: Text("Monthly Spiral Reflection",style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'DMSans',
                                color: AppColors.primaryColor,
                              ),),
                              onTap: () {
                                Get.to(()=> MonthlyReflection());
                              },
                            ),
                            PopupMenuItem(child: Text("Log Out",style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'DMSans',
                              color: AppColors.primaryColor,
                            ),), onTap: () {
                              Get.offAll(()=> SignInOption());
                            }),
                          ],
                          color: AppColors.black,
                          // background
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: AppColors.primaryColor),
                          ),
                        );
                      },
                      child: CustomSvg(asset: "assets/icons/drawer.svg"),
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 43.h,
                    width: 91.w,
                  ),
                  Spacer(),
                ],
              ),
              if (isExpire)
                Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: AppColors.white.withOpacity(.10),
                      border: Border.all(
                        color: AppColors.primaryColor.withOpacity(.36),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.sp,
                        vertical: 8.sp,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 37,
                                height: 37,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26.r),
                                  color: AppColors.black.withOpacity(.48),
                                  border: Border.all(
                                    color: AppColors.primaryColor.withOpacity(
                                      .42,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    "assets/images/logo.png",
                                    width: 28.w,
                                    height: 13.h,
                                  ),
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Text(
                                "Unlock Kunci Hidup Premium",
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'DMSans',
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 40.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Premium access to your soul’s soundtrack.\nAll spirals, all audio guidance",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'DMSans',
                                    color: Colors.grey,
                                  ),
                                ),
                                SizedBox(height: 16.h),

                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32.r),
                                    color: AppColors.white.withOpacity(.10),
                                    border: Border.all(
                                      color: AppColors.primaryColor.withOpacity(
                                        .40,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 18.5,
                                      vertical: 8,
                                    ),
                                    child: Text(
                                      "Go Premium",
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'DMSans',
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 7),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              SizedBox(height: 20.h),
              Text(
                "Kunci Soundscapes",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "DMSans",
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: 12),

              /// Horizontal scrollable category buttons
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16.h),
                  itemCount: assets.length,
                  itemBuilder: (context, index) {
                    return CategoryButton(
                      onPressed: () {
                        if (isExpire == false) {
                          Get.to(
                            () => MusicPlayer(
                              audioLink: assets[index],
                              title: titles[index],
                            ),
                          );
                        }
                      },
                      expire: isExpire,
                      assets: assets[index],
                      title: titles[index],
                    );
                  },
                ),
              ),
              SizedBox(height: 35.h),

              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cardData.length,
                itemBuilder: (context, index) {
                  final item = cardData[index];
                  return ListCardWidget(
                    expire: isExpire,
                    assets: item["assets"]!,
                    title: item["title"]!,
                    subTitle: item["subTitle"]!,
                    onPressed: () {
                      if (isExpire == false) {
                        if (item["assets"] == 'spiral') {
                          Get.to(
                            () => SpiralJourney(
                              appBarAssets: item["assets"]!,
                              appBarTitle: item["title"]!,
                              appBarSubTitle: item["subTitle"]!,
                              bodyTitle: "Choose Your Spiral Journey",
                              bodySubTitle:
                                  "Let your soul choose what it\nneeds right now.",
                            ),
                          );
                        } else if (item["assets"] == 'portal') {
                          Get.to(
                            () => PortalRasa(
                              appBarAssets: item["assets"]!,
                              appBarTitle: item["title"]!,
                              appBarSubTitle: item["subTitle"]!,
                            ),
                          );
                        } else if (item["assets"] == 'ask') {
                          Get.to(
                            () => AskWithIn(
                              appBarAssets: item["assets"]!,
                              appBarTitle: item["title"]!,
                              appBarSubTitle: item["subTitle"]!,
                            ),
                          );
                        } else if (item["assets"] == 'ruang') {
                          Get.to(
                            () => WritingRoom(
                              appBarAssets: item["assets"]!,
                              appBarTitle: item["title"]!,
                              appBarSubTitle: item["subTitle"]!,
                            ),
                          );
                        } else if (item["assets"] == 'mirror') {
                          Get.to(() => MonthlyMirror());
                        }
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 128.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    color: AppColors.white.withOpacity(.08),
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(.19),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Overwhelmed",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'DMSans',
                            color: AppColors.primaryColor,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: AppColors.black,
                          child: CustomSvg(
                            asset: "assets/icons/categorySelected.svg",
                            width: 10,
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
      ],
    );
  }
}
