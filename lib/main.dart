import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_flutter/app/bindings/all_controllers_binding.dart';
import 'package:start_flutter/app/routes/app_pages.dart';
import 'app/routes/not_found_route.dart';

void main() {
  // 앱 시작전 controller 초기화가 필요한 경우 추가.
  // MainBinding.initailize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static final appTitle = 'MyApp';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      /**
       * Smart Management
       *    : GetX provides SmartManagement that lets us configure how dependencies 
       *      hehave in terms of memory management.
       * .full
       *    : Everything gets disposed as soon as the route is removed from navigation stack,
       *      unless declared permanent.
       * .keepFactory
       *    : Just like SmartManagement.full, it will remove it's dependencies when 
       *      it's not being used anymore. However, it will keep their factory,
       *      which means it will recreate the dependency if you need that instance again.
       * . onlyBuilders
       *     : With this option, only controllers started in init: or loaded into a Binding
       *       with Get.lazyPut() will be disposed.
       *       If you use Get.put() or Get.putAsync() or any other approach, 
       *       SmarManagement will not have permissions to exclude this dependency. 
       */
      smartManagement: SmartManagement.full, // .keepFactory, .onlyBuilders
      //
      title: appTitle,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        // Theme.of(context).primaryColor,

        //unselectedWidgetColor: Colors.red, //checkbox테두리 등등.
        scaffoldBackgroundColor: Colors.orange[100],
        appBarTheme: AppBarTheme(
          color: Colors.deepOrange,
        ),
        textTheme: TextTheme(
          headline4: TextStyle(
            fontSize: 20.0,
            color: Colors.deepOrange,
          ),
        ),
        //  데스크탑 플랫폼의 경우 [compact]를 반환하고 다른 플랫폼의 경우
        //  기본 생성 [VisualDensity]를 반환합니다.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      initialBinding: AllControllersBinding(),
      getPages: AppPages.routes,
      unknownRoute: GetPage(
        name: '/notFound',
        page: () => NotFoundRoute(),
      ),
    );
  }
}
