import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/app_colors.dart';
import 'package:kunci_hidup/views/screens/auth/sign_in_option.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    verifyToken();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 178, end: 278).animate(_controller)
      ..addListener(() {
        if (_controller.value == 278) {
          _controller.reverse();
        } else if (_controller.value == 178) {
          _controller.forward();
        }
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(width: double.infinity),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 1,
                  colors: [Color(0xff1d1d1d), Colors.black],
                ),
              ),
              child: Container(),
            ),
          ),
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 374, sigmaY: 374),
            child: Opacity(
              opacity: _animation.value / (278 * 2),
              child: Container(
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.width - 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
          // BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
          //   child: Container(),
          // ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: "logo",
                child: Image.asset(
                  "assets/images/logo.png",
                  width: _animation.value,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "Kunci Hidup App",
                style: TextStyle(
                  fontFamily: "DMSans",
                  fontWeight: FontWeight.w600,
                  fontSize: 20.toDouble() + (_animation.value / 25) - 7,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void verifyToken() async {
    final time = Stopwatch();
    time.start();
    // bool isVerified = await Get.find<AuthController>().previouslyLoggedIn();

    if (time.elapsed < Duration(seconds: 2)) {
      await Future.delayed(Duration(seconds: 2) - time.elapsed);
    }
    Get.offAll(()=> SignInOption(),transition: Transition.noTransition);

    // if (isVerified) {
    //   Get.to(DesignSystem());
    // } else {
    //   Get.to(DesignSystem());
    // }
  }
}
