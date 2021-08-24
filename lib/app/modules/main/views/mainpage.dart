import 'package:flutter/material.dart';
import 'package:start_flutter/app/modules/main/controllers/main_controller.dart';
import '/main.dart';
import 'package:get/get.dart';

/**
 * NOTE <pubspec.yaml> 1번줄 name: <start_flutter>를 프로젝트 패키지이름으로 수정. 
 */

// ignore: slash_for_doc_comments
/** NOTE: GetView<StudentController>: 
 *        If we have single controller as a dependency then we can use GetView instead of StatelessWidget 
 *        and avoid writing Get.find<>()
 *        다수의 controller들을 하나의 controller로 묶어서도 적용할 수 있다.
 *
 *  REVIEW: GetWidget<StudentController>:
 *        It is similar to GetView with one defference it gives the same instance of Get.find everytime.
 *        It becomes very useful when used in combination with Get.create.
*/
class MainPage extends GetView<MainController> {
  //const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // REVIEW: 재로딩할때마다 새로운 instance를 넘겨준다.(controller.hashcode)
    //          GetWidget은 항상 동일한 hashcode를 가진 instance를 돌려준다.
    // Get.create(() => StudentReactiveController());
    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.appTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                '${controller.count}',
                style: TextStyle(fontSize: 32),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: Text('increment'),
              onPressed: () {
                controller.increment();
              },
            ),
          ],
        ),
      ),
    );
  }
}
