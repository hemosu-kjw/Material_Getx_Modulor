import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  //const FirstPage({Key? key}) : super(key: key);
  final String appTitle = 'Title';

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Third',
          style: TextStyle(
            fontSize: 28,
          ),
        ),
      ),
    );
  }
}
