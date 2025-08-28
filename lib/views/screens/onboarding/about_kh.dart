import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import '../../base/bottom_circular_button.dart';
import '../../base/option_button.dart';
import 'help_us_hand.dart';

class AboutKH extends StatefulWidget {
  const AboutKH({super.key});

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
                const SnackBar(
                  content: Text("Please select at least one option."),
                  backgroundColor: Colors.red,
                ),
              );
            } else {
              // proceed
              Get.to(() => const HelpUsHand());
            }
          },
          currentStep: 2,
        ),
      ],
      children: [
        Column(
          children: [
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset("assets/images/logo.png", width: 112),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "How did you knows\nabout KH App",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 21),
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
