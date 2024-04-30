import 'package:get/get.dart';
import 'package:resume_builder_twinkle/modules/resume/resume_controller.dart';

class ResumeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ResumeController());
  }
}