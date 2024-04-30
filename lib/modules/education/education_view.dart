import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_appbar.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_text.dart';
import 'package:resume_builder_twinkle/modules/education/education_controller.dart';
import 'package:resume_builder_twinkle/modules/education/widget/add_education_section_view.dart';
import 'package:resume_builder_twinkle/utiils/math.dart';

class EducationView extends GetView<EducationController> {
  const EducationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: 'Add Education details'),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.dataLength.value,
                  itemBuilder: (BuildContext context, int index) =>
                      addSectionWidget(index: index)),
              SizedBox(height: getSize(20),),
              addSectionButton()
            ],
          ),
        );
      }),
    );
  }

  Widget addSectionWidget({required int index}) {
    return Padding(
      padding: EdgeInsets.only(top: getSize(8), bottom: getSize(8)),
      child: GestureDetector(
        onTap: (){
          Get.to(const AddEducationSectionView());
        },
        child: Container(
          height: 50,
          width: Get.width,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: BaseText(text: "Section ${index + 1}"),
          ),
        ),
      ),
    );
  }

  Widget addSectionButton() {
    return GestureDetector(
      onTap: () {
        controller.dataLength.value++;
      },
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(10)),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: BaseText(text: "+ Add Section"),
        ),
      ),
    );
  }
}
