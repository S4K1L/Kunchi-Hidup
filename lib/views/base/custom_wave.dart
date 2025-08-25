import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';

class CustomWaveformBar extends StatelessWidget {
  final Duration current;
  final Duration total;
  final int barsCount;

  const CustomWaveformBar({
    super.key,
    required this.current,
    required this.total,
    this.barsCount = 26,
  });

  @override
  Widget build(BuildContext context) {
    // Duration per bar segment
    final segmentDuration = total.inMilliseconds / barsCount;

    return SizedBox(
      height: MediaQuery.of(context).size.height / 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(barsCount, (index) {
          // Calculate start time of the segment for this bar
          final barStartTime = Duration(milliseconds: (segmentDuration * index).floor());

          // Bar is active if current playback is past or at bar start time
          final isActive = current >= barStartTime;

          // Heights matching the waveform image, gentle peak pattern
          final heights = [20.0, 40.0, 80.0, 40.0, 20.0, 40.0];
          final height = heights[index % heights.length];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.5),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: 5,
              height: height,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.primaryColor
                    : Colors.white.withOpacity(0.25),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          );
        }),
      ),
    );
  }
}
