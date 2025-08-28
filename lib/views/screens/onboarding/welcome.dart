import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../base/bottom_circular_button.dart';
import 'about_kh.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 32),
              Image.asset("assets/images/logo.png", width: 112),
              Image.asset(
                "assets/images/girlYoga.jpg",
                height: MediaQuery.of(context).size.height / 2.1,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to the\nSanctuary of soul sounds.",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'CormorantGaramond',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Where your feelings find a voice...\nand your silence finds understanding.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DMSans',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
        child: BottomCircularButton(
          onPress: () {
            Get.to(() => AboutKH());
          },
          currentStep: 1,
        ),
      ),
    );
  }
}
