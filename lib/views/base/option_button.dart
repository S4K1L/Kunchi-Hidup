import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/custom_svg.dart';

class OptionButton extends StatelessWidget {
  final String logoName;
  final String title;
  final bool isSelected;
  final VoidCallback? onPressed;

  const OptionButton({
    super.key,
    required this.logoName,
    required this.title,
    this.onPressed,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
    isSelected ? AppColors.primaryColor : Colors.white.withOpacity(0.10);

    final logoBgColor =
    isSelected ? Colors.black : AppColors.primaryColor;

    final logoColor = isSelected ? Colors.white : null;
    final textColor = isSelected ? Colors.black : Colors.white;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: backgroundColor,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 6),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: logoBgColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: CustomSvg(
                      asset: 'assets/icons/$logoName.svg',
                      color: logoColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSans',
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
