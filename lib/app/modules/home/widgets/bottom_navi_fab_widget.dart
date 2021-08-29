import 'package:flutter/material.dart';

class BottomNaviFabWidget extends StatefulWidget {
  //const BottomNaviFabWidget({Key? key}) : super(key: key);
  final int index;
  final ValueChanged<int> onChangedTab;

  BottomNaviFabWidget({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  _BottomNaviFabWidgetState createState() => _BottomNaviFabWidgetState();
}

class _BottomNaviFabWidgetState extends State<BottomNaviFabWidget> {
  final placeholder = Opacity(
    child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    opacity: 0,
  );

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      notchMargin: 4,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(index: 0, icon: Icon(Icons.search)),
          buildTabItem(index: 1, icon: Icon(Icons.mail_outline)),
          placeholder,
          buildTabItem(index: 2, icon: Icon(Icons.account_circle)),
          buildTabItem(index: 3, icon: Icon(Icons.settings)),
        ],
      ),
    );
  }

  Widget buildTabItem({
    required int index,
    required Icon icon,
  }) {
    final isSelected = index == widget.index;

    return IconTheme(
      data: IconThemeData(
        color: isSelected ? Colors.orange : Colors.black,
      ),
      child: IconButton(
        icon: icon,
        onPressed: () => widget.onChangedTab(index),
      ),
    );
  }
}
