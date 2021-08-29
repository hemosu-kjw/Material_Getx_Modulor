import 'package:flutter/material.dart';
import '/main.dart';
import 'package:get/get.dart';

// import 'sub/first_page.dart';
// import 'sub/second_page.dart';
// import 'sub/third_page.dart';
// import 'sub/fourth_page.dart';

class HomeBottomCustomPage extends StatefulWidget {
  //const HomeBottomCustomPage({Key? key}) : super(key: key);
  @override
  _HomeBottomCustomPageState createState() => _HomeBottomCustomPageState();
}

class _HomeBottomCustomPageState extends State<HomeBottomCustomPage> {
  var _selectedIndex = 0.obs; // NOTE getx
  final sizeHeight = 80.0;
  late List<Widget> _widgetOptions;

  // List _widgetOptions = [
  //   FirstPage(),
  //   SecondPage(),
  //   ThirdPage(),
  //   FourthPage(),
  // ];

  @override
  Widget build(BuildContext context) {
    _widgetOptions = [
      buildPage('One'),
      buildPage('Two'),
      buildPage('Three'),
      buildPage('Four'),
    ];
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(MyApp.appTitle),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, sizeHeight),
            child: Obx(
              () => _widgetOptions.elementAt(_selectedIndex.value),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: sizeHeight,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, sizeHeight),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.shopping_basket),
                      onPressed: () {},
                      elevation: 0.1,
                    ),
                  ),
                  Obx(
                    () => Container(
                      width: size.width,
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.home,
                                color: _selectedIndex.value == 0
                                    ? Colors.black
                                    : Colors.black45),
                            onPressed: () {
                              _selectedIndex.value = 0;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.restaurant,
                                color: _selectedIndex.value == 1
                                    ? Colors.black
                                    : Colors.black45),
                            onPressed: () {
                              _selectedIndex.value = 1;
                            },
                          ),
                          Container(width: size.width * 0.20),
                          IconButton(
                            icon: Icon(Icons.bookmark,
                                color: _selectedIndex.value == 2
                                    ? Colors.black
                                    : Colors.black45),
                            onPressed: () {
                              _selectedIndex.value = 2;
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.notifications,
                                color: _selectedIndex.value == 3
                                    ? Colors.black
                                    : Colors.black45),
                            onPressed: () {
                              _selectedIndex.value = 3;
                            },
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // List _widgetOptions = [
  //   FirstPage(),
  //   SecondPage(),
  //   ThirdPage(),
  //   / NOTE: 멤버함수로 멤버변수를 초기화 할 경우 선언은 멤버변수자리, 초기화는 build(){} 안에서 해야 한다.
  //   / buildWidget('one'),
  //   / buildWidget('tow'),
  //   / buildWidget('three'),
  // ];

  Widget buildPage(String text) {
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

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    // NOTE: 시작점.
    Path path = Path()..moveTo(0, 20);
    // 왼쪽 커브 지점들 .
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    // 가운데 반원.
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    // 오른쪽 커브 지점들.
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    // container 채우기.
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    // 종료점.
    path.close();
    //
    canvas.drawShadow(path, Colors.black, 5, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
