import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_appbar.dart';
import 'package:resume_builder_twinkle/commom_widgets/input_field.dart';
import 'package:resume_builder_twinkle/modules/education/education_controller.dart';
import 'package:resume_builder_twinkle/utiils/datePicker_utils.dart';


class AddEducationSectionView extends GetView<EducationController> {
  const AddEducationSectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: "Add education"),
      body: Column(
        children: [
          Form(
              child: Column(
            children: [
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
                              DateFormat('MM/yyyy').format(cancelDate);
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
                              DateFormat('MM/yyyy').format(cancelDate);
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
          ))
        ],
      ),
    );
  }
}
