import 'package:flutter/material.dart';
import 'package:start_flutter/app/modules/home/widgets/bottom_navi_fab_widget.dart';
import '/main.dart';
import 'package:get/get.dart';

import 'sub/first_page.dart';
import 'sub/second_page.dart';
import 'sub/third_page.dart';
import 'sub/fourth_page.dart';

class MainBottomNaviFabPage extends StatefulWidget {
  //const MainBottomNaviFabPage({Key? key}) : super(key: key);
  @override
  _MainBottomNaviFabPageState createState() => _MainBottomNaviFabPageState();
}

class _MainBottomNaviFabPageState extends State<MainBottomNaviFabPage> {
  var _selectedIndex = 0.obs; // NOTE getx
  // late List<Widget> _widgetOptions; // buildWidget()사용시.
  List _widgetOptions = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    FourthPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        title: Text(MyApp.appTitle),
        centerTitle: true,
      ),
      bottomNavigationBar: Obx(
        () => BottomNaviFabWidget(
          // BottomCupertinoWidget(
          index: _selectedIndex.value,
          onChangedTab: onChangedTab,
        ),
      ),
      extendBody: true, // bottomnavigation의 notch(둥근 반원)부분에도 page를 보여준다.
      // NOTE getx
      body: Center(
        child: Obx(
          // NOTE getx
          () => _widgetOptions.elementAt(_selectedIndex.value),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Get
          ..back()
          ..snackbar('title', 'message', backgroundColor: Colors.blue.shade300),
        elevation: 0,
        highlightElevation: 0,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void onChangedTab(int value) {
    _selectedIndex.value = value;
  }

  Widget buildWidget(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 28,
        ),
      ),
    );
  }
}
