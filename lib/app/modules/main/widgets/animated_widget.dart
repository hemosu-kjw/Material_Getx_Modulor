import 'package:flutter/material.dart';

class AnimatedWidget extends StatelessWidget {
  //const AnimatedWidget({Key? key}) : super(key: key);
  final Widget child;

  const AnimatedWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final anmation = NavigationRail.extendedAnimation(context);

    return AnimatedBuilder(
      animation: anmation,
      child: child,
      builder: (context, child) => Container(
        height: 56,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: FloatingActionButton.extended(
            label: child!,
            isExtended: anmation.status != AnimationStatus.dismissed,
            backgroundColor: Colors.red,
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
