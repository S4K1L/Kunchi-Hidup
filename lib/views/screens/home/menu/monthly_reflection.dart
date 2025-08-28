import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/continue_button.dart';
import '../../../../controllers/task_controller.dart';
import '../../../base/chakra_chart.dart';
import '../../../base/custom_scaffold.dart';
import '../../../base/task_card.dart';

class MonthlyReflection extends StatelessWidget {
  const MonthlyReflection({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.put(TaskController());
    taskController.fetchTasks();

    return CustomScaffold(
      isScrollable: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: _buildAppBar(),
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Chakra Activation Trends",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'CormorantGaramond',
                  color: AppColors.white,
                ),
              ),
              Center(child: SizedBox(height: 350, child: ChakraChart())),
              SizedBox(height: 26.h),

              // Section title
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Spiral Journey",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: AppColors.white,
                    ),
                  ),
                  Text(
                    "View All",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'DMSans',
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),

              // Tasks List
              Obx(() {
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
                  height: 110.h,
                  child: ListView.separated(
                    padding: EdgeInsets.only(right: 12.w),
                    // right-side spacing
                    scrollDirection: Axis.horizontal,
                    itemCount: taskController.tasks.length,
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    // space between cards
                    itemBuilder: (context, index) {
                      final task = taskController.tasks[index];
                      return TaskCard(task: task);
                    },
                  ),
                );
              }),

              SizedBox(height: 20.h),

// Healing Toolkit section
              Text(
                "Your Healing Toolkit",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'CormorantGaramond',
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 12.h),

// Toolkit icons row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _toolkitItem("assets/icons/balance.svg", "Somatic\nBalance"),
                  _toolkitItem("assets/icons/acceptance.svg", "Self\nAcceptance"),
                  _toolkitItem("assets/icons/child.svg", "Inner\nChild"),
                ],
              ),

              SizedBox(height: 20.h),

// Journal Entries card
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.08),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomSvg(asset: "assets/icons/journal.svg", height: 22, width: 22),
                            SizedBox(width: 8.w),
                            Text(
                              "Journal Entries",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'DMSans',
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "18 Entries",
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'DMSans',
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: LinearProgressIndicator(
                        value: 18 / 23, // progress
                        backgroundColor: Colors.white.withOpacity(.1),
                        color: AppColors.primaryColor,
                        minHeight: 10.h,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      "23/18 Days Consistent",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: 'DMSans',
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),

// Quote card
              Container(
                padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.05),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Icon(Icons.format_quote, size: 40, color: AppColors.primaryColor),
                    SizedBox(height: 8.h),
                    Text(
                      "Whispers from within",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DMSans',
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "“Trust that healing is already within you”",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'CormorantGaramond',
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.08),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  children: [
                    Icon(Icons.emoji_events, color: AppColors.primaryColor, size: 36),
                    SizedBox(height: 10.h),
                    Text(
                      "You completed 2 Spiral Journeys this month!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DMSans',
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "You made it through. Your soul remembers.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              CustomContinueButton(title: "Download My Reflection", onPress: (){}),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: const Color(0xDFF3F3F3).withOpacity(.10),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: Colors.white.withOpacity(.10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(11.w),
                    child: CustomSvg(
                      asset: "assets/icons/appBarCalendar.svg",
                      height: 24,
                      width: 24,
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Monthly Spiral Reflection",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'DMSans',
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                    Text(
                      "Decode your healing journey this month",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        color: Colors.white,
                        letterSpacing: -0.3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 10,
            child: TextButton(
              child: CustomSvg(asset: "assets/icons/crossBack.svg"),
              onPressed: () => Get.back(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _toolkitItem(String icon, String label) {
    return Container(
      width: 108.w,
      height: 112.h,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.08),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomSvg(asset: icon, height: 30.h, width: 30.w, color: AppColors.primaryColor),
          SizedBox(height: 8.h),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              fontFamily: 'DMSans',
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }



}
