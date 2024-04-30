import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_appbar.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_text.dart';
import 'package:resume_builder_twinkle/commom_widgets/input_field.dart';
import 'package:resume_builder_twinkle/models/education_model.dart';
import 'package:resume_builder_twinkle/modules/education/education_controller.dart';
import 'package:resume_builder_twinkle/modules/skills/skills_binding.dart';
import 'package:resume_builder_twinkle/modules/skills/skills_view.dart';
import 'package:resume_builder_twinkle/utiils/datePicker_utils.dart';

import '../../resume/resume_binding.dart';
import '../../resume/resume_view.dart';

class AddEducationSectionView extends GetView<EducationController> {
  const AddEducationSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const BaseAppBar(title: "Add education"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const BaseText(text: "University/School name"),
                      InputTextField(
                        controller: controller.universityNameController,
                        textInputAction: TextInputAction.next,
                        hintText: "University/School name",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter University/School name";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const BaseText(text: "Qualification"),
                      InputTextField(
                        controller: controller.qualificationController,
                        textInputAction: TextInputAction.next,
                        hintText: "Qualification",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter qualification";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: Get.width / 2.5,
                            child: GestureDetector(
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                var cancelDate = await DatePickerUtils()
                                    .showDatePickerDialog(
                                  context,
                                  controller.startDate.value,
                                  DateTime(1000),
                                  DateTime.now(),
                                );
                                if (cancelDate != null) {
                                  controller.startDate.value = cancelDate;
                                  controller.startDateController.text =
                                      DateFormat('dd-MM-yyyy')
                                          .format(cancelDate);
                                } else {
                                  controller.startDateController.clear();
                                }
                              },
                              child: AbsorbPointer(
                                child: InputTextField(
                                  controller: controller.startDateController,
                                  hintText: 'Start Date',
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: Get.width / 2.5,
                            child: GestureDetector(
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                var cancelDate = await DatePickerUtils()
                                    .showDatePickerDialog(
                                  context,
                                  controller.endDate.value,
                                  DateTime(1000),
                                  DateTime.now(),
                                );
                                if (cancelDate != null) {
                                  controller.endDate.value = cancelDate;
                                  controller.endDateDateController.text =
                                      DateFormat('dd-MM-yyyy')
                                          .format(cancelDate);
                                } else {
                                  controller.endDateDateController.clear();
                                }
                              },
                              child: AbsorbPointer(
                                child: InputTextField(
                                  controller: controller.endDateDateController,
                                  hintText: 'End Date',
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (controller.formKey.currentState!.validate()) {
                      if (controller.isInserted.value == false) {
                        var data = Education(
                            universityName:
                                controller.universityNameController.value.text,
                            qualification:
                                controller.qualificationController.value.text,
                            startDate:
                                Timestamp.fromDate(controller.startDate.value),
                            endDate:
                                Timestamp.fromDate(controller.endDate.value));
                        controller.educationDatabaseService.add(data);
                        Fluttertoast.showToast(
                            msg: "Data inserted successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        controller.isInserted.value = true;
                        Get.back();
                      } else {
                        var data = Education(
                            universityName:
                                controller.universityNameController.value.text,
                            qualification:
                                controller.qualificationController.value.text,
                            startDate:
                                Timestamp.fromDate(controller.startDate.value),
                            endDate:
                                Timestamp.fromDate(controller.endDate.value));
                        controller.educationDatabaseService.update('0', data);
                        Fluttertoast.showToast(
                            msg: "Data updated successfully",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                        Get.to(const ResumeView(), binding: ResumeBinding());
                      }
                    }
                  },
                  child: const Text('Save')),
            ],
          ),
        ));
  }
}
