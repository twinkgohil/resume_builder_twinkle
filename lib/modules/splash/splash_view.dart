import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_text.dart';
import 'package:resume_builder_twinkle/modules/contact_info/contact_info_binding.dart';
import 'package:resume_builder_twinkle/modules/contact_info/contact_info_view.dart';
import 'package:resume_builder_twinkle/modules/education/education_binding.dart';
import 'package:resume_builder_twinkle/modules/education/education_view.dart';
import 'package:resume_builder_twinkle/modules/splash/on_boarding_screen.dart';
import 'package:resume_builder_twinkle/utiils/math.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const OnBoardingScreen(), transition: Transition.fadeIn);
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BaseText(
            text: "Welcome",
            fontSize: getSize(25),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
