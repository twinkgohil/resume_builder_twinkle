import 'package:get/get.dart';
import 'package:resume_builder_twinkle/modules/contact_info/contact_info_controller.dart';

class EducationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ContactInfoController());
  }
}