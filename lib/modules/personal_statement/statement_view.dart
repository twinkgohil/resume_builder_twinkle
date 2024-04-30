import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_appbar.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_text.dart';
import 'package:resume_builder_twinkle/commom_widgets/input_field.dart';
import 'package:resume_builder_twinkle/models/personal_statement_model.dart';
import 'package:resume_builder_twinkle/modules/career/career_binding.dart';
import 'package:resume_builder_twinkle/modules/career/career_view.dart';
import 'package:resume_builder_twinkle/modules/personal_statement/statement_controller.dart';
import 'package:resume_builder_twinkle/modules/resume/resume_binding.dart';
import 'package:resume_builder_twinkle/modules/resume/resume_view.dart';
import 'package:resume_builder_twinkle/utiils/math.dart';

class StatementView extends GetView<StatementController> {
  const StatementView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: const BaseAppBar(
            title: 'Personal Statement',
          ),
          body: Padding(
            padding: EdgeInsets.all(getSize(16)),
            child: Column(
              children: [
                Form(
                    key: controller.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const BaseText(text: "Personal Statement"),
                        InputTextField(
                          controller: controller.statementController,
                          textInputAction: TextInputAction.next,
                          hintText: "Personal Statement",
                          maxLength: 500,
                          maxLines: 7,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter personal statement";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Obx(() {
                          return ElevatedButton(
                              onPressed: () {
                                if (controller.formKey.currentState!
                                    .validate()) {
                                  if (controller.isInserted.value == false) {
                                    var data = PersonalStatement(
                                        statement: controller
                                            .statementController.value.text);
                                    controller.statementDatabaseService.add(
                                        data);
                                    Fluttertoast.showToast(
                                        msg: "Data inserted successfully",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.green,
                                        textColor: Colors.white,
                                        fontSize: 16.0);
                                    controller.isInserted.value = true;
                                    Get.to(const CareerView(), binding: CareerBinding());
                                  } else {
                                    var data = PersonalStatement(
                                        statement: controller
                                            .statementController.value.text);
                                    controller.statementDatabaseService
                                        .update(Get.arguments.toString(), data);
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
                              child: Text('Save'));
                        }),
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
