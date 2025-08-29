import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import '../../../controllers/music_player_controller.dart';
import '../../../utils/app_colors.dart';
import '../../base/custom_wave.dart';

class MusicPlayer extends StatefulWidget {
  final String audioLink;
  final String title;
   const MusicPlayer({super.key, required this.audioLink, required this.title});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  final MusicPlayerController controller = Get.put(MusicPlayerController());

  @override
  void initState() {
    super.initState();
    controller.fetchAndPlayAudio(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: true,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
               SizedBox(height: 16),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  child: CustomSvg(asset: "assets/icons/leftArrow.svg"),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              SizedBox(height: 32.h),
              Image.asset("assets/images/logo.png", width: 144.w),
              SizedBox(height: 78.h),

              CustomSvg(asset: "assets/icons/musicHead.svg"),

               SizedBox(height: 24.h),
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DMSans',
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),

               SizedBox(height: 10.h),
              Obx(() => Text(
                controller.audioArtist.value,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSans',
                  color: Colors.white,
                ),
              )),

               SizedBox(height: 50.h),

              // Progress bar with current time and total duration
              Obx(() {
                final pos = controller.position.value;
                final dur = controller.duration.value ?? Duration(seconds: 1);
                return Row(
                  children: [
                    Text(controller.formatDuration(pos), style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                    SizedBox(width: 8.w),
                    Expanded(child: CustomWaveformBar(current: pos, total: dur)),
                    SizedBox(width: 8.w),
                    Text(controller.formatDuration(dur), style: TextStyle(color: Colors.white, fontSize: 12.sp)),
                  ],
                );
              }),




               SizedBox(height: 24.h),

              // Playback controls
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 47.w),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22.r),
                      // ignore: deprecated_member_use
                      color: Colors.white.withOpacity(.10),
                      border: Border.all(color: AppColors.primaryColor.withOpacity(.40))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: CustomSvg(asset: 'assets/icons/backWard.svg'),
                        iconSize: 32..sp,
                        onPressed: controller.skipBackward,
                      ),
                       SizedBox(width: 24.w),
                      Obx(() {
                        if (controller.isLoading.value) {
                          return CircularProgressIndicator();
                        }

                        return IconButton(
                          icon: CircleAvatar(
                            backgroundColor: AppColors.primaryColor.withOpacity(.21),
                            child: Center(
                              child: Icon(
                                controller.isPlaying.value ? Icons.pause : Icons.play_arrow,
                                color: AppColors.primaryColor,
                                size: 30.sp,
                              ),
                            ),
                          ),
                          onPressed: controller.playPause,
                        );
                      }),

                       SizedBox(width: 24.w),
                      IconButton(
                        icon: CustomSvg(asset: 'assets/icons/forWard.svg'),
                        iconSize: 32.sp,
                        onPressed: controller.skipForward,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
