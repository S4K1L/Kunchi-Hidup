import 'dart:ui';
import 'package:flutter/material.dart';

class EdgeBlurOverlay extends StatelessWidget {
  final AlignmentGeometry align;
  final bool isReversed;

  const EdgeBlurOverlay({
    super.key,
    required this.align,
    this.isReversed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Container(
        width: 80,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: isReversed ? Alignment.centerRight : Alignment.centerLeft,
            end: isReversed ? Alignment.centerLeft : Alignment.centerRight,
            colors: const [
              Colors.black54,
              Colors.black26,
              Colors.transparent,
            ],
            stops: const [0.0, 0.4, 1.0],
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: .5, sigmaY: .5),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
