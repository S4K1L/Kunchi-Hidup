import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:kunci_hidup/utils/app_colors.dart';

class ChakraChart extends StatelessWidget {
  const ChakraChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white.withOpacity(.10),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Chart with arrows
          SizedBox(
            height: MediaQuery.of(context).size.height / 3.6,
            child: Stack(
              children: [
                LineChart(
                  LineChartData(
                    minX: 0,
                    maxX: 18,
                    minY: 2,
                    maxY: 14,
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 32,
                          getTitlesWidget: (value, meta) => Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 3,
                          getTitlesWidget: (value, meta) => Text(
                            value.toInt().toString(),
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: true,
                      verticalInterval: 5, // → 3 columns (0, 6, 12, 18)
                      horizontalInterval: 4, // → 4 rows (2, 6, 10, 14)
                      getDrawingHorizontalLine: (value) => FlLine(
                        color: Colors.white.withOpacity(0.10),
                        strokeWidth: 1,
                        dashArray: [3, 3],
                      ),
                      getDrawingVerticalLine: (value) => FlLine(
                        color: Colors.white.withOpacity(0.1),
                        strokeWidth: 1,
                        dashArray: [3, 3],
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    lineBarsData: [
                      _buildLine(
                          [6, 8, 9, 10, 9, 10, 11], const Color(0xFF00CFFF)),
                      _buildLine(
                          [8, 9, 10, 11, 11, 11, 13], const Color(0xFFB266FF)),
                      _buildLine(
                          [8, 9, 10, 11, 12, 12, 14], const Color(0xFFFF5DE0)),
                      _buildLine(
                          [9, 6, 6, 6, 6, 3, 3], const Color(0xFFE00B5D)),
                      _buildLine(
                          [4, 3, 3, 5, 7, 8, 6], const Color(0xFFFF9500)),
                      _buildLine(
                          [5, 6, 7, 7, 8, 8, 9], const Color(0xFFFFD60A)),
                      _buildLine(
                          [12, 11, 9, 9, 8, 7, 4], const Color(0xFF34C759)),
                    ],
                  ),
                ),
                // Overlay arrow painter
                Positioned.fill(
                  child: CustomPaint(
                    painter: AxisArrowPainter(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Legend
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _LegendItem(color: Color(0xFF00CFFF), text: "Throat"),
                  SizedBox(width: 16),
                  _LegendItem(color: Color(0xFFB266FF), text: "Third Eye"),
                  SizedBox(width: 16),
                  _LegendItem(color: Color(0xFFFF5DE0), text: "Crown"),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _LegendItem(color: Color(0xFFE00B5D), text: "Root"),
                  SizedBox(width: 16),
                  _LegendItem(color: Color(0xFFFF9500), text: "Sacral"),
                  SizedBox(width: 16),
                  _LegendItem(color: Color(0xFFFFD60A), text: "Solar Plexus"),
                  SizedBox(width: 16),
                  _LegendItem(color: Color(0xFF34C759), text: "Heart"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  LineChartBarData _buildLine(List<double> values, Color color) {
    return LineChartBarData(
      isCurved: true,
      color: color,
      barWidth: 2.5,
      dotData: FlDotData(show: false),
      spots: List.generate(
        values.length,
            (i) => FlSpot(i * 3.0, values[i]),
      ),
    );
  }
}

class AxisArrowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white70
      ..strokeWidth = 1.5;

    // X axis arrow (bottom right)
    final xEnd = Offset(size.width - 12, size.height - 20);
    canvas.drawLine(Offset(32, size.height - 20), xEnd, paint);
    _drawArrowHead(canvas, xEnd, const Offset(8, 0), paint);

    // Y axis arrow (top left)
    final yEnd = Offset(32, 12);
    canvas.drawLine(Offset(32, size.height - 20), yEnd, paint);
    _drawArrowHead(canvas, yEnd, const Offset(0, -8), paint);
  }

  void _drawArrowHead(Canvas canvas, Offset tip, Offset direction, Paint paint) {
    final path = Path();
    path.moveTo(tip.dx, tip.dy);
    path.lineTo(tip.dx - direction.dy / 2, tip.dy + direction.dx / 2);
    path.lineTo(tip.dx + direction.dy / 2, tip.dy - direction.dx / 2);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const _LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
