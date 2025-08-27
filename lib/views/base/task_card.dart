import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kunci_hidup/models/task_model.dart';

import '../../utils/app_colors.dart';
import '../../utils/custom_svg.dart';

class TaskCard extends StatelessWidget {
  final TaskModel task;
  const TaskCard({
    super.key, required this.task
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 215.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: AppColors.white.withOpacity(.10)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: task.progress == false  ? AppColors.inProgress.withOpacity(.10) : AppColors.completed.withOpacity(.10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 7.5.w,
                  vertical: 4.w,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 6.r,
                      backgroundColor: task.progress == false  ? AppColors.inProgress : AppColors.completed,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      task.progress == false  ? "In Progress" : "Completed",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'DMSans',
                        color: task.progress  == false ? AppColors.inProgress : AppColors.completed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Text(
              task.title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
                fontFamily: 'DMSans',
                color: AppColors.white,
              ),
            ),
            Row(
              children: [
                CustomSvg(asset: "assets/icons/whiteCalendar.svg"),
                SizedBox(width: 7.w),
                Text(
                  "${task.date.day} ${_monthName(task.date.month)}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'DMSans',
                    color: Colors.grey,
                  ),
                ),
                Text(
                  task.progress == false
                      ? " - In Progress"
                      : (task.completeDate != null
                      ? "- ${task.completeDate!.day} ${_monthName(task.completeDate!.month)}"
                      : "- Completed"),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'DMSans',
                    color: Colors.grey,
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }
}