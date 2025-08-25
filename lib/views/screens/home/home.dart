import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import '../../base/category_button.dart';
import '../../base/list_card_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

    return CustomScaffold(
      drawerBarChildren: const [
        Text("data", style: TextStyle(color: Colors.white)),
      ],
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
                        Scaffold.of(context).openDrawer();
                      },
                      child: CustomSvg(asset: "assets/icons/drawer.svg"),
                    ),
                  ),
                  const Spacer(),
                  Image.asset("assets/images/logo.png", height: 43.h, width: 91.w),
                  const Spacer(),
                ],
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
              const SizedBox(height: 12),

              /// Horizontal scrollable category buttons
              SizedBox(
                height: MediaQuery.of(context).size.height / 10,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16.h),
                  itemCount: assets.length,
                  itemBuilder: (context, index) {
                    return CategoryButton(
                      assets: assets[index],
                      title: titles[index],
                    );
                  },
                ),
              ),
              SizedBox(height: 35.h),
              ListCardWidget(assets: 'spiral', title: "Spiral Journey", subTitle: 'Start Your  Spiral Journey', onPressed: () {  },),
              ListCardWidget(assets: 'portal', title: "Portal Rasa", subTitle: 'Your Emotional Companion', onPressed: () {  },),
              ListCardWidget(assets: 'ask', title: "Ask Within", subTitle: 'Portal to your patterns', onPressed: () {  },),
              ListCardWidget(assets: 'ruang', title: "Ruang Menulis", subTitle: 'Writing Space', onPressed: () {  },),
              ListCardWidget(assets: 'mirror', title: "Monthly Mirror", subTitle: 'Journey Result', onPressed: () {  },),
              SizedBox(height: 20.h),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 128.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32.r),
                    color: AppColors.white.withOpacity(.08),
                    border: Border.all(color: AppColors.primaryColor.withOpacity(.19))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Overwhelmed",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,fontFamily: 'DMSans',color: AppColors.primaryColor),),
                        SizedBox(width: 4.w),
                        CircleAvatar(
                            radius: 10,
                            backgroundColor: AppColors.black,
                            child: CustomSvg(asset: "assets/icons/categorySelected.svg",width: 10,))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

