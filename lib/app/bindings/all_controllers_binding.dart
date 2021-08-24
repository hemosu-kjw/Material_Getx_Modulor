import 'package:get/get.dart';
import 'package:start_flutter/app/controllers/all_controllers.dart';

class AllControllersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllControllers>(() => AllControllers());

    // Get.put(MyController());
    // Get.put(HomeController());
  }
}
