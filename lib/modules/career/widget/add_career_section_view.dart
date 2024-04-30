import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_appbar.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_text.dart';
import 'package:resume_builder_twinkle/commom_widgets/input_field.dart';
import 'package:resume_builder_twinkle/models/career_model.dart';
import 'package:resume_builder_twinkle/modules/career/career_controller.dart';
import 'package:resume_builder_twinkle/utiils/datePicker_utils.dart';

class AddCareerSectionView extends GetView<CareerController> {
  const AddCareerSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(title: "Add Career"),
      body: Obx(() {
        return Column(
          children: [
            Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const BaseText(text: "Company Name"),
                    InputTextField(
                      controller: controller.companyNameController,
                      textInputAction: TextInputAction.next,
                      hintText: "Company Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter company name";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const BaseText(text: "Job Title"),
                    InputTextField(
                      controller: controller.jobTitleController,
                      textInputAction: TextInputAction.next,
                      hintText: "Job Title",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter job title";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const BaseText(text: "Skills"),
                    InputTextField(
                      controller: controller.skillsController,
                      textInputAction: TextInputAction.next,
                      hintText: "skills",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter skills";
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
                              var cancelDate =
                                  await DatePickerUtils().showDatePickerDialog(
                                context,
                                controller.startDate.value,
                                DateTime(3000),
                                DateTime.now(),
                              );
                              if (cancelDate != null) {
                                controller.startDate.value = cancelDate;
                                controller.startDateController.text =
                                    DateFormat('dd-MM-yyyy').format(cancelDate);
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
                              var cancelDate =
                                  await DatePickerUtils().showDatePickerDialog(
                                context,
                                controller.endDate.value,
                                DateTime(3000),
                                DateTime.now(),
                              );
                              if (cancelDate != null) {
                                controller.endDate.value = cancelDate;
                                controller.endDateDateController.text =
                                    DateFormat('dd-MM-yyyy').format(cancelDate);
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
                      var data = Career(
                          companyName: controller.companyNameController.text,
                          jobTitle: controller.jobTitleController.text,
                          skills: controller.skillsController.text,
                          startDate:
                              Timestamp.fromDate(controller.startDate.value),
                          endDate:
                              Timestamp.fromDate(controller.endDate.value));
                      controller.careerDatabaseService.add(data);
                      Fluttertoast.showToast(
                          msg: "Data inserted successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      controller.isInserted.value = true;
                    } else {
                      var data = Career(
                          companyName: controller.companyNameController.text,
                          jobTitle: controller.jobTitleController.text,
                          skills: controller.skillsController.text,
                          startDate:
                              Timestamp.fromDate(controller.startDate.value),
                          endDate:
                              Timestamp.fromDate(controller.endDate.value));
                      controller.careerDatabaseService.update('0', data);
                      Fluttertoast.showToast(
                          msg: "Data updated successfully",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }
                },
                child: const Text('Save')),
          ],
        );
      }),
    );
  }
}
