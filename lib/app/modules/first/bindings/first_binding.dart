import 'package:get/get.dart';
import 'package:start_flutter/app/modules/first/controllers/first_controller.dart';

class FirstBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirstController>(
      () => FirstController(),
    );
  }

  // @override
  // void dependencies() {
  //   Get.put(CountControllerWithGetx());
  // }
}
