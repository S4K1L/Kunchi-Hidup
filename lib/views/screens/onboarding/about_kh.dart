import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import '../../base/bottom_circular_button.dart';
import '../../base/option_button.dart';
import 'help_us_hand.dart';

class AboutKH extends StatefulWidget {
   AboutKH({super.key});

  @override
  State<AboutKH> createState() => _AboutKHState();
}

class _AboutKHState extends State<AboutKH> {
  int? selectedIndex;

  void _selectOption(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final options = [
      {'logo': 'socialMedia', 'title': 'Social Media'},
      {'logo': 'ads', 'title': 'Ads'},
      {'logo': 'appStore', 'title': 'App Store'},
      {'logo': 'wordOfMouth', 'title': 'Word Of Mouth'},
      {'logo': 'podCast', 'title': 'Podcasts / Media'},
      {'logo': 'medical', 'title': 'Therapist / Medical Professional'},
      {'logo': 'stream', 'title': 'Streaming Platforms'},
    ];

    return CustomScaffold(
      isScrollable: true,
      hasTopGlow: false,
      hasBottomGlow: false,
      bottomBarChildren: [
        BottomCircularButton(
          onPress: () {
            if (selectedIndex == null) {
              // show warning
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text("Please select at least one option."),
                  backgroundColor: Colors.red,
                ),
              );
            } else {
              // proceed
              Get.to(() =>  HelpUsHand());
            }
          },
          currentStep: 2,
        ),
      ],
      children: [
        Column(
          children: [
             SizedBox(height: 32.h),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("assets/images/logo.png", width: 112.w),
            ),
             SizedBox(height: 35),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Text(
                    "How did you knows\nabout KH App",
                    style: TextStyle(
                      fontSize: 35.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: Colors.white,
                    ),
                  ),
                   SizedBox(height: 21.h),
                  Column(
                    children: List.generate(options.length, (index) {
                      return OptionButton(
                        logoName: options[index]['logo']!,
                        title: options[index]['title']!,
                        isSelected: selectedIndex == index,
                        onPressed: () => _selectOption(index),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
