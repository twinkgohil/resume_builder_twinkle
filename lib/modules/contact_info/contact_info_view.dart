import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:resume_builder_twinkle/commom_widgets/base_appbar.dart';
import 'package:resume_builder_twinkle/commom_widgets/input_field.dart';
import 'package:resume_builder_twinkle/models/contact_info_model.dart';
import 'package:resume_builder_twinkle/modules/contact_info/contact_info_controller.dart';

class ContactInfoView extends GetView<ContactInfoController> {
  const ContactInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const BaseAppBar(title: "Contact Information"),
        body: Column(
          children: [
            Form(
                child: Column(
              children: [
                getCommonTextView(text: "Full Name"),
                InputTextField(
                  controller: controller.fullNameController,
                  textInputAction: TextInputAction.next,
                  hintText: "FullName",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter Full Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                getCommonTextView(text: "Email"),
                InputTextField(
                  controller: controller.emailController,
                  textInputAction: TextInputAction.next,
                  hintText: "Email",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter email";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                getCommonTextView(text: "Phone Number"),
                InputTextField(
                  controller: controller.phoneNumberController,
                  textInputType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  hintText: "Phone Number",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter phone number";
                    }
                    return null;
                  },
                ),
              ],
            )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    if (controller.isInserted.value == false) {
                      var data = ContactInfo(
                          email: controller.emailController.value.text,
                          mobileNumber:
                              controller.phoneNumberController.value.text,
                          name: controller.fullNameController.value.text);
                      controller.contactDatabaseService.add(data);
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
                      var data = ContactInfo(
                          email: controller.emailController.value.text,
                          mobileNumber:
                              controller.phoneNumberController.value.text,
                          name: controller.fullNameController.value.text);
                      controller.contactDatabaseService.update('0', data);
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
                child: Text('Save')),
          ],
        ),
      ),
    );
  }

  getCommonTextView({required String text}) {
    return Text(text);
  }
}
