import 'package:get/get.dart';
import 'package:start_flutter/app/modules/main/bindings/first_binding.dart';
import 'package:start_flutter/app/modules/main/views/sub/first_page.dart';

part 'main_routes.dart';

class MainPages {
  MainPages._();

  static final routes = [
    GetPage(
      name: _MainPaths.FIRST,
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
