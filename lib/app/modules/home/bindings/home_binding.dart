import 'package:get/get.dart';
import 'package:start_flutter/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }

  void initailize() {
    //TODO: add to initailized something.
  }

  // @override
  // void dependencies() {
  //   Get.put(CountControllerWithGetx());
  // }
}
