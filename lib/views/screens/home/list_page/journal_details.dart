import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/models/journal_model.dart';
import 'package:kunci_hidup/views/base/continue_button.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/custom_svg.dart';
import '../../../base/custom_scaffold.dart';

class JournalDetails extends StatefulWidget {
  final JournalModel journal;

  const JournalDetails({super.key, required this.journal});

  @override
  State<JournalDetails> createState() => _JournalDetailsState();
}

class _JournalDetailsState extends State<JournalDetails> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // Pre-fill with existing journal content
    _controller = TextEditingController(text: widget.journal.description ?? "");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      useSafeArea: false,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Stack(
            children: [
              /// Top AppBar
              Container(
                height: 110.h,
                decoration: BoxDecoration(
                  color: const Color(0xDFF3F3F3).withOpacity(.10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Get.back();
                        },
                        child: CustomSvg(asset: "assets/icons/back.svg"),
                      ),
                      Expanded(
                        child: Text(
                          widget.journal.title ?? "Journal",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'DMSans',
                            color: AppColors.primaryColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Body
              Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22),
                    ),
                    color: AppColors.black,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(15.sp),
                    child: TextFormField(
                      controller: _controller,
                      maxLines: null,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        color: AppColors.white,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "${widget.journal.createdAt.day} ${_monthName(widget.journal.createdAt.month)}, ${widget.journal.createdAt.year}",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 10.sp,
                      fontFamily: 'DMSans',
                      color: AppColors.white,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }

  // simple month helper
  String _monthName(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }
}
