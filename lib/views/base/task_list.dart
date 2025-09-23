import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/task_card.dart';

import '../../controllers/task_controller.dart';
import '../../models/task_model.dart';

class TaskList extends StatelessWidget {
  final TaskController taskController;

  const TaskList({super.key, required this.taskController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (taskController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      if (taskController.tasks.isEmpty) {
        return const Center(
          child: Text(
            "No tasks found",
            style: TextStyle(color: Colors.white70),
          ),
        );
      }

      return SizedBox(
        height: 130.h,
        child: ListView.separated(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          scrollDirection: Axis.horizontal,
          itemCount: taskController.tasks.length,
          separatorBuilder: (_, __) => SizedBox(width: 12.w),
          itemBuilder: (context, index) {
            final task = taskController.tasks[index];
            return _buildResponsiveTaskCard(task);
          },
        ),
      );
    });
  }

  // Method to build the task card with responsiveness
  Widget _buildResponsiveTaskCard(TaskModel task) {
    return SizedBox(
      width: _getCardWidth(),
      child: TaskCard(task: task),
    );
  }

  double _getCardWidth() {
    double screenWidth = ScreenUtil().screenWidth;

    if (screenWidth < 375) {
      return 180.w;
    } else if (screenWidth < 600) {
      return 220.w;
    } else {
      return 250.w;
    }
  }
}
