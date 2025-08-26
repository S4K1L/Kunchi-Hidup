import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: const Color(0xFFFEAA39).withOpacity(0.4), // orange glow border
          width: 1,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2A2A2A),
            Color(0xFF1D1D1D),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFEAA39).withOpacity(0.2),
            blurRadius: 20,
            spreadRadius: 1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        child: TextFormField(
          controller: controller,
          maxLines: 6,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontFamily: "DMSans",
          ),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 16.sp,
              fontFamily: "DMSans",
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
