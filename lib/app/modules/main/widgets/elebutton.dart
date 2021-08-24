import 'package:flutter/material.dart';

class EleButton extends StatelessWidget {
  final String text;
  final bool isIcon;
  final IconData icon;

  final double fontSize;
  final Color textColor;
  final Color backgroundColor;
  final double radius;
  final VoidCallback onPressed;

  const EleButton({
    required this.text,
    this.isIcon = false, // icon 유무.
    this.icon = Icons.settings,
    this.fontSize = 20,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.deepOrange,
    this.radius = 16,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // icon 추가.
            isIcon ? Icon(icon, size: 28) : Icon(icon, size: 0),
            isIcon ? const SizedBox(width: 8) : const SizedBox(width: 0),
            Text(
              text,
              style: TextStyle(fontSize: fontSize, color: textColor),
            ),
          ],
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.focused)) return Colors.red;
            if (states.contains(MaterialState.hovered)) return Colors.green;
            if (states.contains(MaterialState.pressed)) return Colors.blue;
            return Theme.of(context).primaryColor;
          }),
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 24, vertical: 8)),
        ),
      );
}
