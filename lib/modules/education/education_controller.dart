import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:resume_builder_twinkle/services/education_db_service.dart';

class EducationController extends GetxController {
  var dataLength = 1.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  EducationDatabaseService educationDatabaseService =
      EducationDatabaseService();

  TextEditingController universityNameController = TextEditingController();
  TextEditingController qualificationController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateDateController = TextEditingController();

  RxBool isInserted = false.obs;
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().obs;


}
