import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/custom_scaffold.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      hasBottomGlow: false,
      isScrollable: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(82), // Height of AppBar
        child: Container(
          height: 126,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            color: Color(0xDFF3F3F3).withOpacity(.10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Title text
                Text(
                  "Privacy Policy for Kunci Hidup App",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'DMSans',
                    color: Colors.white,
                    letterSpacing: -0.3,
                  ),
                ),
                // Close button
                IconButton(
                  icon: Icon(Icons.highlight_remove, color: Colors.white),
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      children: [
        SizedBox(height: 24),
        Text(
          "Privacy Policy For Kunci\nHidup App",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
            fontFamily: 'CormorantGaramond',
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 26),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              informationField(
                "General Information",
                "We, Kunci Hidup App GmbH, Sophienstraße 21, 10178 Berlin (hereinafter also referred to as “Kunci Hidup”) collect and process your Personal Data in connection with the Kunci Hidup App (hereinafter also referred to as “App”) and are “controller” within the meaning of the EU General Data Protection Regulation (GDPR).",
              ),
              SizedBox(height: 18),
              Divider(color: Colors.white.withOpacity(.20),),
              SizedBox(height: 18),
              informationField(
                "Definitions",
                'Personal Data means any information relating to a living person which can be identified, directly or indirectly, in particular by reference to an identifier, such as a name, an identification number, location data or an online..',
              ),
              SizedBox(height: 18),
              Divider(color: Colors.white.withOpacity(.20),),
              SizedBox(height: 18),
              informationField(
                  "General Information",
                  'We, Kunci Hidup App GmbH, Sophienstraße 21, 10178 Berlin (hereinafter also referred to as “Kunci Hidup”) collect and process your Personal Data in connection with the Kunci Hidup App (hereinafter also referred to as “App”) and are “controller” within the meaning of the EU General Data Protection Regulation (GDPR).'
              ),
            ],
          ),
        ),

      ],
    );
  }

  Column informationField(String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'CormorantGaramond',
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
        description,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'DMSans',
            color: Colors.white,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
