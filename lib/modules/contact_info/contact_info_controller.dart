import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:resume_builder_twinkle/services/contact_db_service.dart';

class ContactInfoController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  ContactDatabaseService contactDatabaseService = ContactDatabaseService();

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  RxBool isInserted = false.obs;

}