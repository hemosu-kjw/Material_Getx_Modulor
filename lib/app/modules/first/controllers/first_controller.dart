import 'package:get/get.dart';

class FirstController extends GetxController {
  var count = 1.obs;
  void increment() {
    count++;
  }
}
