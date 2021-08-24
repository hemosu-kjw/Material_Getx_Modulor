import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BottomCupertinoWidget extends StatefulWidget {
  //const BottomCupertinoWidget({Key? key}) : super(key: key);
  final int index;
  final ValueChanged<int> onChangedTab;

  BottomCupertinoWidget({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  _BottomCupertinoWidgetState createState() => _BottomCupertinoWidgetState();
}

class _BottomCupertinoWidgetState extends State<BottomCupertinoWidget> {
  late ValueListenable<ScaffoldGeometry> geometryListenable;

  final items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'One',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Two',
    ),
    BottomNavigationBarItem(
      icon: Container(),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'Three',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Four',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return buildNotchedCupertino(
      child: CupertinoTabBar(
          items: items,
          currentIndex: widget.index >= 2 ? widget.index + 1 : widget.index,
          inactiveColor: Colors.black,
          onTap: (index) {
            final newIndex = getIndex(index);
            if (newIndex == null) {
              return;
            } else {
              widget.onChangedTab(newIndex);
            }
          }),
    );
  }

  int? getIndex(int index) {
    if (index == 2) return null;
    final newIndex = index > 2 ? index - 1 : index;

    return newIndex;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    geometryListenable = Scaffold.geometryOf(context);
  }

  Widget buildNotchedCupertino({
    required Widget child,
  }) {
    final colorCupertinoBorder = CupertinoDynamicColor.withBrightness(
        color: Color(0x4c000000), darkColor: Color(0x29000000));

    return CustomPaint(
      painter: _BottomAppBarPainter(
        color: colorCupertinoBorder,
        shape: CircularNotchedRectangle(),
        geometry: geometryListenable,
        notchMargin: 5,
      ),
      child: PhysicalShape(
        clipper: _BottomAppBarClipper(
          shape: CircularNotchedRectangle(),
          geometry: geometryListenable,
          notchMargin: 5,
        ),
        color: Colors.transparent,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Material(
          color: Colors.transparent,
          child: child,
        ),
      ),
    );
  }
}

class _BottomAppBarClipper extends CustomClipper<Path> {
  final ValueListenable<ScaffoldGeometry> geometry;
  final NotchedShape shape;
  final double notchMargin;

  const _BottomAppBarClipper({
    required this.geometry,
    required this.shape,
    required this.notchMargin,
  })  : assert(geometry != null),
        assert(shape != null),
        assert(notchMargin != null),
        super(reclip: geometry);

  @override
  Path getClip(Size size) {
    final Rect? button = geometry.value.floatingActionButtonArea
        ?.translate(0.0, geometry.value.bottomNavigationBarTop! * -1.0);
    return shape.getOuterPath(
      Offset.zero & size,
      button?.inflate(notchMargin),
    );
  }

  @override
  bool shouldReclip(_BottomAppBarClipper oldClipper) {
    return oldClipper.geometry != geometry ||
        oldClipper.shape != shape ||
        oldClipper.notchMargin != notchMargin;
  }
}

class _BottomAppBarPainter extends CustomPainter {
  final ValueListenable<ScaffoldGeometry> geometry;
  final NotchedShape shape;
  final double notchMargin;
  final Color color;

  const _BottomAppBarPainter({
    required this.geometry,
    required this.shape,
    required this.notchMargin,
    required this.color,
  })  : assert(geometry != null),
        assert(shape != null),
        assert(notchMargin != null);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect? button = geometry.value.floatingActionButtonArea
        ?.translate(0.0, geometry.value.bottomNavigationBarTop! * -1.0);

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1
      ..color = color;

    final path = shape.getOuterPath(
      Offset.zero & size,
      button?.inflate(notchMargin),
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
