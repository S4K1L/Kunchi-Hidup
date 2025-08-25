import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_svg.dart';

class ListCardWidget extends StatelessWidget {
  final String assets;
  final String title;
  final String subTitle;
  final VoidCallback onPressed;
  const ListCardWidget({
    super.key, required this.assets, required this.title, required this.onPressed, required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: EdgeInsets.only(bottom: 12.w),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.h),
              color: AppColors.white.withOpacity(.10)
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: CustomSvg(asset: "assets/icons/homeOverwhelmed/$assets.svg"),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: "DMSans",
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: "DMSans",
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
