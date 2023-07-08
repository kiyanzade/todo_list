import 'package:get/get.dart';
import 'package:to_do_app/controllers/task_controller.dart';

import 'controllers/textField_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskController());
    Get.put(TextFiledController());
  }
}
