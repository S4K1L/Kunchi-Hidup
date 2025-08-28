import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/utils/custom_svg.dart';

import '../../../utils/app_colors.dart';
import '../../base/custom_scaffold.dart';
import '../../base/ios_dialog.dart';

class SubscriptionsPage extends StatelessWidget {
  const SubscriptionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(82),
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
        SizedBox(height: 37),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              color: AppColors.primaryColor.withOpacity(.10),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12,right: 12, top: 18),
              child: Column(
                children: [
                  CustomSvg(asset: "assets/icons/lock.svg", width: 50),
                  SizedBox(height: 12),
                  Text(
                    "Beri Hadiah untuk\nDiri Otentikmu",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Akses semua spiral, audio\npenyembuhan, pembacaan chakra,\ndan peta jiwa pribadi.",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12),
                  markWithText(
                    "orangeTick",
                    "Pembacaan chakra + audio penyembuhan",
                  ),
                  markWithText(
                    "orangeTick",
                    "Spiral harian & jurnal reflektif",
                  ),
                  markWithText(
                    "orangeTick",
                    "Decoder jiwa untuk trauma & identitas",
                  ),
                  markWithText(
                    "orangeTick",
                    "Audio visualisasi & afirmasi terpandu",
                  ),
                  SizedBox(height: 34),
                  Text(
                    "Your Healing Journey Awaits",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'CormorantGaramond',
                      color: AppColors.primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "No pressure, cancel anytime.\nBegin for free, stay only if it feels right.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DMSans',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: (){
                      showPurchaseSuccessDialog(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                        color: AppColors.primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryColor.withOpacity(0.6),
                            blurRadius: 20,
                            spreadRadius: 3,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                        child: Column(
                          children: [
                            Text(
                              "Start Free for 10 Days",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'DMSans',
                              ),
                            ),
                            Text(
                              "Then Rp161000/month",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'DMSans',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 40),
      ],
    );
  }

  Padding markWithText(String assets, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          CustomSvg(asset: "assets/icons/$assets.svg", width: 22),
          SizedBox(width: 6),
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: "DMSans",
              color: Colors.white,
            ),
          ),
        ],
      ),
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
