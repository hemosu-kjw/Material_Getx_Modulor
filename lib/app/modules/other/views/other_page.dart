import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:start_flutter/app/modules/other/controllers/other_controller.dart';

class OtherPage extends GetView<OtherController> {
  //const FirstPage({Key? key}) : super(key: key);
  final String appTitle = 'Title';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Other',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '${controller.count}',
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );

    // Widget buildList() => ListView(
    //       children: [
    //         Container(
    //           margin: EdgeInsets.only(bottom: 8),
    //           child: Image.network(
    //             'https://source.unsplash.com/random?sig=1',
    //             height: 300,
    //           ),
    //         )
    //       ].expand((image) => [image, image, image, image, image]).toList(),
    //     );
  }
}
