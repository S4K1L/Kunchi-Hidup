import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/continue_button.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/custom_svg.dart';
import '../../../base/custom_scaffold.dart';

class WritingField extends StatefulWidget {
  const WritingField({super.key});

  @override
  State<WritingField> createState() => _WritingFieldState();
}

class _WritingFieldState extends State<WritingField> {
  final TextEditingController _controller = TextEditingController();

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
                          if (_controller.text.isNotEmpty) {
                            final discard = await showDiscardDialog(context);
                            if (discard == true) {
                              Get.back(); // only pop if discard confirmed
                            }
                          } else {
                            Get.back(); // no text, just go back
                          }
                        },
                        child: CustomSvg(asset: "assets/icons/back.svg"),
                      ),
                      Image.asset(
                        "assets/images/logo.png",
                        height: 39,
                        width: 83,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add,
                            color: AppColors.white, size: 24.h),
                      )
                    ],
                  ),
                ),
              ),
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
                      controller: _controller, // attach controller
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
                left: 15,
                right: 15,
                bottom: 30,
                child: CustomContinueButton(
                  title: "Save",
                  onPress: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Future<bool?> showDiscardDialog(BuildContext context) async {
    return showCupertinoDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('Discard changes?'),
          content: const Text('Your changes are not saved'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(false); // cancel
              },
              isDefaultAction: true,
              child: Text('keep editing',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400),),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop(true); // confirm discard
              },
              isDestructiveAction: true,
              child: Text('Discard',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w400),),
            ),
          ],
        );
      },
    );
  }
}
