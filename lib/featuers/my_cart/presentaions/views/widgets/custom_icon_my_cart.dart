import 'package:flutter/material.dart';

class CustomIconMyCart extends StatelessWidget {
  const CustomIconMyCart({
    super.key,
    required this.icon,
    this.onPressed,
    this.color,
  });
  final IconData icon;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(icon), onPressed: onPressed, iconSize: 25, color: color);
  }
}
