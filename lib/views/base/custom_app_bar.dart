import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool hasLeading;
  final bool showLogo;
  final bool visible;
  final String? leadingIcon;
  final String? subtitle;
  final Widget? trailing;

  const CustomAppBar({
    super.key,
    this.title,
    this.hasLeading = true,
    this.showLogo = false,
    this.visible = true,
    this.leadingIcon,
    this.subtitle,
    this.trailing,
  });

  @override
  Size get preferredSize => Size(double.infinity, 82);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: visible ? 5 : 0,
          sigmaY: visible ? 5 : 0,
          tileMode: TileMode.clamp,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: visible
                ? Color(0xff5d4728).withValues(alpha: 0.40)
                : Colors.transparent,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            border: Border(
              bottom: BorderSide(
                color: visible
                    ? Colors.white.withValues(alpha: 0.2)
                    : Colors.transparent,
                width: 1.5,
              ),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Row(
                children: [
                  SizedBox(width: 16),
                  hasLeading
                      ? InkWell(
                          child: CustomSvg(
                            asset: "assets/icons/back.svg",
                            height: 24,
                            width: 24,
                          ),
                        )
                      : SizedBox(height: 24, width: 24),
                  SizedBox(width: 24),

                  if (leadingIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CustomSvg(
                        asset: leadingIcon!,
                        height: 46,
                        width: 46,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: leadingIcon == null
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        Text(
                          title ?? "",
                          style: TextStyle(
                            fontFamily: "DM Sans",
                            fontWeight: FontWeight.w700,
                            fontSize: 24,
                            height: 1,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          subtitle ?? "",
                          style: TextStyle(
                            fontFamily: "DM Sans",
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            height: 1,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  trailing != null ? Container() : const SizedBox(width: 24),
                  const SizedBox(width: 16),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
