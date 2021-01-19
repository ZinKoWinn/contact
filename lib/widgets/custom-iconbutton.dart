import 'package:flutter/material.dart';

class MyIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;
  final double size;

  const MyIconButton(
      {Key key, this.icon, this.onPressed, this.color, this.size = 30.0})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        icon,
        color: color,
        size: size,
      ),
      onTap: onPressed,
    );
  }
}
