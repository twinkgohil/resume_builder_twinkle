import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:resume_builder_twinkle/services/contact_db_service.dart';
import 'package:resume_builder_twinkle/services/statement_db_service.dart';

class StatementController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  StatementDatabaseService statementDatabaseService =
      StatementDatabaseService();

  TextEditingController statementController = TextEditingController();
  RxBool isInserted = false.obs;
}
