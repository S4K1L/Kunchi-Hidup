import 'package:flutter/material.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';

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
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
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
                  Image.asset("assets/images/logo.png", height: 43, width: 91),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 20),
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
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  itemCount: assets.length,
                  itemBuilder: (context, index) {
                    return CategoryButton(
                      assets: assets[index],
                      title: titles[index],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String assets;
  final String title;
  const CategoryButton({
    super.key,
    required this.assets,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                color: Colors.white.withOpacity(.10),
                border: Border.all(
                  color: AppColors.primaryColor.withOpacity(.17),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: CustomSvg(asset: "assets/icons/$assets.svg"),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: "DMSans",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
