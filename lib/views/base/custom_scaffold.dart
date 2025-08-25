import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomScaffold extends StatelessWidget {
  final List<Widget> children;
  final List<Widget>? bottomBarChildren;
  final List<Widget>? drawerBarChildren;
  final bool isScrollable;
  final bool hasGlow;
  final bool hasBottomGlow;
  final bool hasTopGlow;
  final bool useSafeArea;
  final bool extendBodyBehindAppBar;
  final PreferredSizeWidget? appBar;

  const CustomScaffold({
    super.key,
    required this.children,
    this.isScrollable = false,
    this.hasGlow = false,
    this.hasBottomGlow = true,
    this.hasTopGlow = true,
    this.useSafeArea = true,
    this.extendBodyBehindAppBar = true,
    this.appBar,
    this.bottomBarChildren,
    this.drawerBarChildren,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    );

    double glowSize = MediaQuery.of(context).size.width - 70;

    return Scaffold(
      appBar: appBar,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      drawer: drawerBarChildren == null || drawerBarChildren!.isEmpty
          ? null
          : Drawer(
        backgroundColor: Colors.black, // Visible background
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 15),
            children: drawerBarChildren!,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Background gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  radius: 1,
                  colors: [Color(0xff1d1d1d), Colors.black],
                ),
              ),
            ),
          ),

          // Top orange glow
          if (hasTopGlow)
            Positioned(
              left: 0,
              right: 0,
              top: -glowSize / 2,
              child: Container(
                height: glowSize,
                width: glowSize,
                decoration: BoxDecoration(
                  color: const Color(0xffFEAA39).withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),

          // Bottom orange glow
          if (hasBottomGlow)
            Positioned(
              left: 0,
              right: 0,
              bottom: -glowSize + 80,
              child: Container(
                height: glowSize,
                width: glowSize,
                decoration: BoxDecoration(
                  color: const Color(0xffFEAA39).withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
            ),

          // Blur overlay
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 250, sigmaY: 200),
            child: Container(),
          ),

          // Main content
          SizedBox(
            width: double.infinity,
            child: isScrollable
                ? SingleChildScrollView(
              child: SafeArea(
                top: useSafeArea,
                bottom: useSafeArea,
                child: Column(children: children),
              ),
            )
                : SafeArea(
              top: useSafeArea,
              bottom: useSafeArea,
              child: Column(children: children),
            ),
          ),
        ],
      ),

      // Bottom bar
      bottomNavigationBar: bottomBarChildren == null || bottomBarChildren!.isEmpty
          ? null
          : Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: bottomBarChildren!,
        ),
      ),
    );
  }
}
