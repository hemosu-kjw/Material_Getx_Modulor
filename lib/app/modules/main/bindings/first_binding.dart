import 'package:get/get.dart';
import 'package:start_flutter/app/modules/main/controllers/first_controller.dart';

class FirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstController());
  }
}
