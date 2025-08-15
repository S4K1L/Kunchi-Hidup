import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffold extends StatelessWidget {
  final List<Widget> children;
  final bool isScrollable;
  final bool hasGlow;
  final bool hasBottomGlow;
  final PreferredSizeWidget? appBar;
  const CustomScaffold({
    super.key,
    required this.children,
    this.isScrollable = false,
    this.hasGlow = false,
    this.hasBottomGlow = true,
    this.appBar,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    double glowSize = MediaQuery.of(context).size.width - 70;
    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
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

          Positioned(
            left: 0,
            right: 0,
            top: -glowSize / 2,
            child: Container(
              height: glowSize,
              width: glowSize,
              decoration: BoxDecoration(
                color: Color(0xffFEAA39),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -glowSize + 80,
            child: Container(
              height: glowSize,
              width: glowSize,
              decoration: BoxDecoration(
                color: Color(0xffFEAA39),
                shape: BoxShape.circle,
              ),
            ),
          ),

          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 250, sigmaY: 200),
            child: Container(),
          ),

          SizedBox(
            width: double.infinity,
            child: isScrollable
                ? SingleChildScrollView(
                    child: SafeArea(child: Column(children: children)),
                  )
                : SafeArea(child: Column(children: children)),
          ),
        ],
      ),
    );
  }
}
