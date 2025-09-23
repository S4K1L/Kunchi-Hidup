import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunci_hidup/models/task_model.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_svg.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  final VoidCallback? onTap;

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // simple breakpointing based on the space the parent gives us
        final isCompact = constraints.maxWidth < 280;   // phones in a grid / small list tile
        final isWide    = constraints.maxWidth > 420;   // tablets or very wide tiles

        final containerColor = AppColors.white.withOpacity(.10);
        final statusColor = task.progress == false ? AppColors.inProgress : AppColors.completed;

        return ConstrainedBox(
          // keep sane bounds but don’t force a fixed size
          constraints: const BoxConstraints(minWidth: 160, maxWidth: 560),
          child: Material(
            color: containerColor,
            borderRadius: BorderRadius.circular(12.r),
            child: InkWell(
              borderRadius: BorderRadius.circular(12.r),
              onTap: onTap,
              child: Padding(
                // responsive padding
                padding: EdgeInsets.symmetric(
                  vertical: isCompact ? 8.h : 12.h,
                  horizontal: isCompact ? 12.w : 16.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // status chip
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: statusColor.withOpacity(.10),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: isCompact ? 6.w : 8.w,
                        vertical: isCompact ? 3.h : 4.h,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CircleAvatar(
                            radius: isCompact ? 5.r : 6.r,
                            backgroundColor: statusColor,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            task.progress == false ? "In Progress" : "Completed",
                            style: TextStyle(
                              fontSize: (isCompact ? 10.sp : 12.sp).clamp(10, 14),
                              fontWeight: FontWeight.w600,
                              fontFamily: 'DMSans',
                              color: statusColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: isCompact ? 12.h : 18.h),

                    // title (wrap if needed)
                    Text(
                      task.title,
                      maxLines: isWide ? 2 : 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: (isWide ? 20.sp : 18.sp).clamp(16, 22),
                        fontWeight: FontWeight.w700,
                        fontFamily: 'DMSans',
                        color: AppColors.white,
                        height: 1.2,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    // date row – allow wrapping on small widths
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 7.w,
                      runSpacing: 6.h,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 2.h),
                          child: CustomSvg(
                            asset: "assets/icons/whiteCalendar.svg",
                            // if CustomSvg supports size, consider making it responsive too
                          ),
                        ),
                        _DateText(
                          start: _formatDate(task.date),
                          trailing: task.progress == false
                              ? "In Progress"
                              : (task.completeDate != null
                              ? _formatDate(task.completeDate!)
                              : "Completed"),
                          compact: isCompact,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime d) => "${d.day} ${_monthName(d.month)}";

  String _monthName(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[(month - 1).clamp(0, 11)];
  }
}

class _DateText extends StatelessWidget {
  final String start;
  final String trailing;
  final bool compact;

  const _DateText({
    required this.start,
    required this.trailing,
    required this.compact,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontSize: (compact ? 13.sp : 16.sp).clamp(12, 16),
      fontWeight: FontWeight.w500,
      fontFamily: 'DMSans',
      color: Colors.grey,
      height: 1.25,
    );

    return Flexible(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(text: start, style: style),
            TextSpan(text: "  -  ", style: style),
            TextSpan(text: trailing, style: style),
          ],
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
