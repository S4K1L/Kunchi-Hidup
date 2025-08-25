import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_svg.dart';

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
                child: CustomSvg(asset: "assets/icons/homeCategoryIcon/$assets.svg",height: 35,width: 35,),
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