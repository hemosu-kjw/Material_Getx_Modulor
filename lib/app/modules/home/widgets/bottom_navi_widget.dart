import 'package:flutter/material.dart';

class BottomNaviWidget extends StatefulWidget {
  //const BottomNaviWidget({Key? key}) : super(key: key);
  final int index;
  final ValueChanged<int> onChangedTab;

  const BottomNaviWidget({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  _BottomNaviWidgetState createState() => _BottomNaviWidgetState();
}

class _BottomNaviWidgetState extends State<BottomNaviWidget> {
  List colors = [
    Colors.white,
    Colors.white.withOpacity(.60),
    Colors.white.withOpacity(.60),
    Colors.white.withOpacity(.60),
  ];

  @override
  Widget build(BuildContext context) => buildBottomNavigationBar();

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xfffa7d0f),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(.60),
      selectedFontSize: 14,
      unselectedFontSize: 14,
      currentIndex: widget.index, //NOTE getx: 현재 선택된 Index
      onTap: (index) {
        setColor(index);
        widget.onChangedTab(index);
      },
      items: [
        BottomNavigationBarItem(
          label: 'One',
          icon: Icon(Icons.favorite),
          // icon: Text('Draggable', style: TextStyle(color: colors[0])),
        ),
        BottomNavigationBarItem(
          label: 'Two',
          icon: Icon(Icons.music_note),
          //ANCHOR:1- icon: Text('Draggable', style: TextStyle(color: colors[1])),
        ),
        BottomNavigationBarItem(
          label: 'Three',
          icon: Icon(Icons.location_on),
          //ANCHOR:1- icon: Text('Draggable', style: TextStyle(color: colors[2])),
        ),
        BottomNavigationBarItem(
          label: 'Four',
          icon: Icon(Icons.location_on),
          //ANCHOR:1- icon: Text('Draggable', style: TextStyle(color: colors[3])),
        ),
      ],
    );
  }

  void setColor(int index) {
    for (int i = 0; i < colors.length; i++) {
      if (i == index) {
        colors[i] = Colors.white;
      } else {
        colors[i] = Colors.white.withOpacity(0.60);
      }
    }
  }
}
