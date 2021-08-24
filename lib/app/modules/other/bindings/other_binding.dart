import 'package:get/get.dart';
import 'package:start_flutter/app/modules/other/controllers/other_controller.dart';

class OtherBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtherController>(
      () => OtherController(),
    );
  }

  // @override
  // void dependencies() {
  //   Get.put(CountControllerWithGetx());
  // }
}
