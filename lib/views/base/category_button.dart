import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_svg.dart';
import '../screens/home/music_player.dart';

class CategoryButton extends StatelessWidget {
  final bool expire;
  final String assets;
  final String title;
  final VoidCallback onPressed;
  const CategoryButton({
    super.key,
    required this.assets,
    required this.title, required this.expire, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
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
            if(expire)
              Positioned(
              right: 0,
              bottom: 20,
              child: CircleAvatar(
                radius: 12,
                backgroundColor: AppColors.black,
                child: CustomSvg(asset: "assets/icons/newLock.svg",height: 15.h),
              ),
            )
          ],
        ),
      ),
    );
  }
}