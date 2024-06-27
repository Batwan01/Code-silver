import 'package:flutter/material.dart';

class CompBtn extends StatelessWidget {
  final double width;
  final double height;
  final Function callback;
  final Color color;
  final double radius;
  final Widget child;

  const CompBtn({required this.width, required this.height, required this.child, required this.color, required this.callback, this.radius = 5.0, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          fixedSize: Size(width, height),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
        ),
        onPressed: () {
          callback();
        },
        child: child);
  }
}
