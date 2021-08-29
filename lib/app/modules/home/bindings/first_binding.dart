import 'package:get/get.dart';
import 'package:start_flutter/app/modules/home/controllers/first_controller.dart';

class FirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FirstController());
  }
}
