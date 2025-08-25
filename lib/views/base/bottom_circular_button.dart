import 'package:flutter/material.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';

class BottomCircularButton extends StatelessWidget {
  final VoidCallback onPress;
  final int currentStep;
  const BottomCircularButton({
    super.key,
    required this.onPress,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    final step = currentStep.clamp(1, 5);
    final progress = step / 5;

    return GestureDetector(
      onTap: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Continue",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'DMSans',
              color: Colors.white,
            ),
          ),
          CustomPaint(
            foregroundPainter: CircleProgressPainter(progress: progress, color: Color(0xFF9D6B27)),
            child: Container(
              height: 54,
              width: 54,
              decoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: CustomSvg(asset: 'assets/icons/rightArrow.svg'),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress;
  final Color color;

  CircleProgressPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final strokeWidth = 3.0;
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth / 2;

    final backgroundPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    // Draw background arc (full circle)
    canvas.drawCircle(center, radius, backgroundPaint);

    // Draw progress arc
    double startAngle = -90 * 3.1415926535897932 / 180; // Starting at top (12 o'clock)
    double sweepAngle = 2 * 3.1415926535897932 * progress;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CircleProgressPainter oldDelegate) {
    return oldDelegate.progress != progress || oldDelegate.color != color;
  }
}
