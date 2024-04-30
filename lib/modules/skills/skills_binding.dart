import 'package:get/get.dart';
import 'package:resume_builder_twinkle/modules/contact_info/contact_info_controller.dart';
import 'package:resume_builder_twinkle/modules/skills/skills_controller.dart';

class SkillsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SkillsController());
  }
}