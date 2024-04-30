import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_text.dart';
import 'package:resume_builder_twinkle/modules/contact_info/contact_info_binding.dart';
import 'package:resume_builder_twinkle/modules/contact_info/contact_info_view.dart';
import 'package:resume_builder_twinkle/modules/resume/resume_binding.dart';
import 'package:resume_builder_twinkle/modules/resume/resume_view.dart';
import 'package:resume_builder_twinkle/utiils/math.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
                height: getSize(40),
                width: Get.width / 1.5,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(ContactInfoView(), binding: ContactInfoBinding());
                    },
                    child: const BaseText(text: 'Create New Resume'))),
            SizedBox(
              height: getSize(10),
            ),
            SizedBox(
                height: getSize(40),
                width: Get.width / 1.5,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(const ResumeView(), binding: ResumeBinding());
                    },
                    child: const BaseText(text: 'Edit Existing Resume')))
          ],
        ),
      ),
    );
  }
}
