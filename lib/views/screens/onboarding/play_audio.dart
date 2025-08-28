import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import '../../../utils/app_colors.dart';
import '../../base/custom_wave.dart';
import '../subscriptions/subscriptions.dart';

class PlayAudio extends StatefulWidget {
   PlayAudio({super.key});

  @override
  State<PlayAudio> createState() => _PlayAudioState();
}

class _PlayAudioState extends State<PlayAudio> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  late Stream<Duration> _positionStream;
  late Stream<Duration?> _durationStream;

  @override
  void initState() {
    super.initState();
    _initAudio();

    // Listen to player state changes to detect when audio finishes
    _audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.processingState == ProcessingState.completed) {
        Get.to(()=> SubscriptionsPage());
      }
    });
  }


  Future<void> _initAudio() async {
    try {
      await _audioPlayer.setAsset('assets/audio/sample.mp3');
      _positionStream = _audioPlayer.positionStream;
      _durationStream = _audioPlayer.durationStream;
    } catch (e) {
      print("Error loading audio: $e");
    }
  }
  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }


  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _skipForward() {
    final newPosition = _audioPlayer.position +  Duration(seconds: 10);
    final total = _audioPlayer.duration ?? Duration.zero;

    if (newPosition < total) {
      _audioPlayer.seek(newPosition);
    } else {
      _audioPlayer.seek(total);
    }
  }

  void _skipBackward() {
    final newPosition = _audioPlayer.position -  Duration(seconds: 10);
    _audioPlayer.seek(newPosition < Duration.zero ? Duration.zero : newPosition);
  }


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: true,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
               SizedBox(height: 16.h),
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

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(123.h),
                  color: AppColors.primaryColor.withOpacity(.10),
                  border: Border.all(color: AppColors.primaryColor, width: 5.w),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(60.sp),
                  child: CustomSvg(asset: "assets/icons/earphone.svg"),
                ),
              ),

               SizedBox(height: 24.h),
              Text(
                "Grief Ritual - Breathe Into Loss",
                style: TextStyle(
                  fontSize: 26.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'CormorantGaramond',
                  color: AppColors.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
               SizedBox(height: 10.h),
               Text(
                "Voice By Daissy",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'DMSans',
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),

               SizedBox(height: 50.h),

              // Progress bar with current time and total duration
              StreamBuilder<Duration>(
                stream: _audioPlayer.positionStream,
                builder: (context, snapshot) {
                  final position = snapshot.data ?? Duration.zero;
                  final duration = _audioPlayer.duration ??  Duration(seconds: 1);

                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        // Start Time
                        Text(
                          _formatDuration(position),
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                         SizedBox(width: 8.w),

                        // Waveform Progress Bar
                        Expanded(
                          child: CustomWaveformBar(current: position, total: duration),
                        ),

                         SizedBox(width: 8.w),

                        // End Time
                        Text(
                          _formatDuration(duration),
                          style:  TextStyle(
                            color: Colors.white,
                            fontSize: 12.sp,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),



               SizedBox(height: 24.h),

              // Playback controls
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 47.w),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.r),
                    color: Colors.white.withOpacity(.10),
                    border: Border.all(color: AppColors.primaryColor.withOpacity(.40))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: CustomSvg(asset: 'assets/icons/backWard.svg'),
                        iconSize: 32.sp,
                        onPressed: _skipBackward,
                      ),
                       SizedBox(width: 24.w),
                      StreamBuilder<PlayerState>(
                        stream: _audioPlayer.playerStateStream,
                        builder: (context, snapshot) {
                          final isPlaying = snapshot.data?.playing ?? false;
                          final processingState = snapshot.data?.processingState;

                          if (processingState == ProcessingState.loading ||
                              processingState == ProcessingState.buffering) {
                            return  CircularProgressIndicator();
                          } else if (isPlaying) {
                            return IconButton(
                              icon: CircleAvatar(
                                  backgroundColor: AppColors.primaryColor.withOpacity(.21),
                                  child: Padding(
                                    padding:  EdgeInsets.all(5.sp),
                                    child: Icon(Icons.pause, color: AppColors.primaryColor,size: 30.sp,),
                                  )),
                              onPressed: _audioPlayer.pause,
                            );
                          } else {
                            return IconButton(
                              icon: CircleAvatar(
                                  backgroundColor: AppColors.primaryColor.withOpacity(.21),
                                  child: Padding(
                                    padding:  EdgeInsets.all(5),
                                    child: Icon(Icons.play_arrow, color: AppColors.primaryColor,size: 30.sp,),
                                  )),
                              onPressed: _audioPlayer.play,
                            );
                          }
                        },
                      ),
                       SizedBox(width: 24.w),
                      IconButton(
                        icon: CustomSvg(asset: 'assets/icons/forWard.svg'),
                        iconSize: 32.sp,
                        onPressed: _skipForward,
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
