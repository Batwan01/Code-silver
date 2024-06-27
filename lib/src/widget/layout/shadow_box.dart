import 'package:flutter/material.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';

class ShadowBox extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  final Color? color;
  final double radius;
  final Border? border;

  const ShadowBox({this.width, this.height, this.border, required this.child, this.color, this.radius = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: border,
        color: color ?? CustomColor.sf_100,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 3,
            offset: Offset(0, 1), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
