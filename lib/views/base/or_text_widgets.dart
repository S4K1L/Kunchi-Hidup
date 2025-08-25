import 'package:flutter/material.dart';

import '../../utils/custom_svg.dart';

class OrSeparatorWidget extends StatelessWidget {
  const OrSeparatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Use CustomSvg to load the first SVG
        Expanded(child: CustomSvg(asset: 'assets/icons/Line2.svg')),

        // The 'Or' text in the middle
        Text(
          'Or',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'DMSans',
          ),
        ),

        // Use CustomSvg to load the second SVG
        Expanded(child: CustomSvg(asset: 'assets/icons/Line3.svg')),
      ],
    );
  }
}
