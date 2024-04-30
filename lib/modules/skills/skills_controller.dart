import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:resume_builder_twinkle/services/skills_db_service.dart';

class SkillsController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SkillsDatabaseService skillsDatabaseService = SkillsDatabaseService();

  TextEditingController skillsController = TextEditingController();
  RxBool isInserted = false.obs;
}
