import 'package:flutter/material.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';

class CompTextBtn extends StatelessWidget {
  final double? width;
  final double height;
  final Function callback;
  final Color color;
  final double radius;
  final Widget child;
  final Border? border;

  const CompTextBtn({super.key, this.width, required this.height, this.border, required this.callback, required this.color, this.radius = 4.0, required this.child});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          callback();
        },
        child: Ink(
          width: width,
          height: height,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: CustomColor.sf_black.withOpacity(0.25),
                blurRadius: 2,
                offset: const Offset(0,2),
              ),
            ],
            border: border,
            color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
