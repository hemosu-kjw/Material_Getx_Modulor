import 'package:flutter/material.dart';
import 'package:start_flutter/main.dart';

import 'sub/first_page.dart';
import 'sub/second_page.dart';
import 'sub/third_page.dart';
import 'sub/fourth_page.dart';

class MainTabBottomPage extends StatefulWidget {
  //const MainTabBottomPage({Key? key}) : super(key: key);
  final String appTitle = 'AppBar UI';

  @override
  _MainTabBottomPageState createState() => _MainTabBottomPageState();
}

class _MainTabBottomPageState extends State<MainTabBottomPage>
    with SingleTickerProviderStateMixin {
  late TabController controller; // TabController
  var img;

  @override
  initState() {
    super.initState();
    imageLoading();
    // TabController
    controller = TabController(
      length: 4,
      vsync: this,
    );
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        children: [
          // DefaultTabController(
          //   length: 4,
          //   child:
          Scaffold(
            extendBodyBehindAppBar: true, // ANCHOR appbar 투명화.
            appBar: AppBar(
              // title: Text('${MyApp.appTitle} ${controller.index + 1}'),
              title: Text(MyApp.appTitle),
              backgroundColor: Colors.transparent, // ANCHOR appbar 투명화.
              elevation: 0.0, // ANCHOR appbar 투명화.
              titleSpacing: 30.0,
              centerTitle: true,
              leading: IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              actions: [
                IconButton(
                    icon: Icon(Icons.notifications_none), onPressed: () {}),
                SizedBox(width: 10.0),
                IconButton(icon: Icon(Icons.search), onPressed: () {}),
                SizedBox(width: 10.0),
              ],
              // backgroundColor: Colors.green[300],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: img, fit: BoxFit.cover),
                  gradient: LinearGradient(
                    colors: [Colors.green, Color(0xffEF5350)],
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                  ),
                ),
              ),
              bottom: TabBar(
                controller: controller, // TabController
                indicatorWeight: 3.0,
                indicatorColor: Colors.white,
                isScrollable: false,
                tabs: [
                  Tab(icon: Icon(Icons.home), text: 'Home'),
                  Tab(icon: Icon(Icons.list_alt), text: 'Feed'),
                  Tab(icon: Icon(Icons.person), text: 'Profile'),
                  Tab(icon: Icon(Icons.settings), text: 'Settings'),
                ],
              ),
            ),

            body: TabBarView(
              controller: controller, // TabController
              children: <Widget>[
                FirstPage(),
                SecondPage(),
                ThirdPage(),
                FourthPage(),
              ],
            ),
          ),
          // ),
        ],
      ),
    );
  }

  Future<void> imageLoading() async {
    img = AssetImage('assets/home.jpg');
  }
}
