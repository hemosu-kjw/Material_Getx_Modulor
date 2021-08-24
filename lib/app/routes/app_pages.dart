import 'package:get/get.dart';
import 'package:start_flutter/app/modules/main/bindings/first_binding.dart';
import 'package:start_flutter/app/modules/main/bindings/main_binding.dart';
import 'package:start_flutter/app/modules/main/views/mainpage.dart';
import 'package:start_flutter/app/modules/main/views/sub/first_page.dart';
import 'package:start_flutter/app/modules/other/bindings/other_binding.dart';
import 'package:start_flutter/app/modules/other/views/other_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => MainPage(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.OTHER,
      binding: OtherBinding(),
      page: () => OtherPage(),
    ),
    // main
    GetPage(
      name: _Paths.FIRST,
      page: () => FirstPage(),
      binding: FirstBinding(),
    ),

    // GetPage(
    //   name: _Paths.BOTTOM,
    //   page: () => MainBottomNaviFabPage(),
    //   //customTransition: CustomSizeTransition(),
    //   transition: Transition.zoom,
    // ),
  ];
}
