import 'package:flutter/material.dart';
import 'package:kunci_hidup/views/base/custom_app_bar.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';

class DesignSystem extends StatelessWidget {
  const DesignSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasGlow: true,
      appBar: CustomAppBar(title: "Hello World", leadingIcon: "assets/icons/edit.svg",),
      isScrollable: true,
      children: [
      FlutterLogo(size: 400,), const SizedBox(height:  800),
    ]);
  }
}