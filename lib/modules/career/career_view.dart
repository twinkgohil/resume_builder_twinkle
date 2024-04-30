import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_appbar.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_text.dart';
import 'package:resume_builder_twinkle/modules/career/career_controller.dart';
import 'package:resume_builder_twinkle/modules/career/widget/add_career_section_view.dart';
import 'package:resume_builder_twinkle/modules/education/education_binding.dart';
import 'package:resume_builder_twinkle/modules/education/education_view.dart';
import 'package:resume_builder_twinkle/utiils/math.dart';

class CareerView extends GetView<CareerController> {
  const CareerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: 'Add Career details'),
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
              addSectionButton(),
              ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      Get.to(const EducationView(), binding: EducationBinding());
                    }
                  },
                  child: const Text('Save')),
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
          Get.to(const AddCareerSectionView());
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
