import 'package:get/get.dart';
import 'package:resume_builder_twinkle/modules/contact_info/contact_info_controller.dart';
import 'package:resume_builder_twinkle/modules/personal_statement/statement_controller.dart';

class StatementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StatementController());
  }
}