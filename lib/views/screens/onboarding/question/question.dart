import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kunci_hidup/views/base/custom_scaffold.dart';
import 'package:kunci_hidup/views/screens/onboarding/chakra_details.dart';
import '../../../base/progress_bar.dart';
import '../../../base/question_button.dart';

class Question extends StatefulWidget {
   Question({super.key});

  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  int currentQuestionIndex = 0;
  int? selectedAnswerIndex;

  // 🔸 Placeholder list of 6 questions
  final List<String> questions = [
    "Apakah kamu sering merasa tidak aman baik secara finansial, fisik, maupun relasi?",
    "Apakah kamu merasa sulit mempercayai orang lain?",
    "Apakah kamu sering merasa tidak cukup baik?",
    "Apakah kamu merasa kesepian walaupun bersama orang lain?",
    "Apakah kamu merasa cemas akan masa depan?",
    "Apakah kamu merasa kehilangan arah dalam hidup?"
  ];

  void selectAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });

    Future.delayed( Duration(milliseconds: 300), () {
      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedAnswerIndex = null;
        });
      } else {
        Get.to(()=> ChakraDetails());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isScrollable: true,
      hasTopGlow: false,
      hasBottomGlow: false,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
               SizedBox(height: 30.h),
              ProgressBar(currentIndex: currentQuestionIndex),
               SizedBox(height: 32.h),
              Image.asset("assets/images/logo.png", width: 112.w),
               SizedBox(height: 35.h),

              // 🔄 Animate Question Text
              AnimatedSwitcher(
                duration:  Duration(milliseconds: 300),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin:  Offset(0.0, 0.2),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                ),
                child: Text(
                  questions[currentQuestionIndex],
                  key: ValueKey<int>(currentQuestionIndex),
                  style:  TextStyle(
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'CormorantGaramond',
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

               SizedBox(height: 55.h),

              // Answer Buttons
              QuestionButton(
                title: 'Yes',
                assets: "tick",
                isSelected: selectedAnswerIndex == 0,
                onTap: () => selectAnswer(0),
              ),
              QuestionButton(
                title: 'No',
                assets: "cancel",
                isSelected: selectedAnswerIndex == 1,
                onTap: () => selectAnswer(1),
              ),
              QuestionButton(
                title: 'Sometimes',
                assets: "minus",
                isSelected: selectedAnswerIndex == 2,
                onTap: () => selectAnswer(2),
              ),

               SizedBox(height: 55),
               Text(
                "Jawabanmu akan membantu kami\nmengenali energimu, tanpa menghakimi",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DMSans',
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
