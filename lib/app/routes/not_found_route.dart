import 'package:flutter/material.dart';

class NotFoundRoute extends StatelessWidget {
  //const NotFoundRoute({Key? key}) : super(key: key);
  final String appTitle = 'Not Found Page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Not Found Page',
          style: TextStyle(
            fontSize: 32,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
