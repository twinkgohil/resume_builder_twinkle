import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_appbar.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_text.dart';
import 'package:resume_builder_twinkle/modules/education/education_controller.dart';

class EducationView extends GetView<EducationController> {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: 'Add Education details'),
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: controller.dataLength.value,
              itemBuilder: (BuildContext context, int index) =>
                  addSectionWidget(index: index)),
        ],
      ),
    );
  }

  Widget addSectionWidget({required int index}) {
    return Container(
      height: 30,
      width: Get.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: BaseText(text: "Section ${index + 1}"),
    );
  }

  Widget addSectionButton() {
    return GestureDetector(
      onTap: () {
        controller.dataLength.value++;
      },
      child: Container(
        height: 30,
        width: Get.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(10)),
        child: const BaseText(text: "+ Add Section"),
      ),
    );
  }
}
