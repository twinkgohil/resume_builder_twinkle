import 'package:get/get.dart';
import 'package:resume_builder_twinkle/modules/career/career_controller.dart';
import 'package:resume_builder_twinkle/modules/contact_info/contact_info_controller.dart';

class CareerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CareerController());
  }
}