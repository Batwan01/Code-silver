
// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';

class DefaultBorderBox extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;

  final bool disableBorderT;
  final bool disableBorderB;
  final bool disableBorderL;
  final bool disableBorderR;

  final double borderWidth;
  final Color? borderColor;
  final Color backgroundColor;
  final Widget child;

  const DefaultBorderBox(
      {super.key,
      this.width,
      this.height,
      this.borderWidth = 1.0,
      required this.radius,
      this.disableBorderT = false,
      this.disableBorderB = false,
      this.disableBorderL = false,
      this.disableBorderR = false,
      required this.child,
      required this.backgroundColor,
      this.borderColor,});

  @override
  Widget build(BuildContext context) {
    Color? _borderColor = borderColor ?? CustomColor.sf_200;

    BorderRadius borderRadius = BorderRadius.only(
      topLeft: disableBorderT ? Radius.zero : Radius.circular(radius),
      topRight: disableBorderT ? Radius.zero : Radius.circular(radius),
      bottomLeft: disableBorderB ? Radius.zero : Radius.circular(radius),
      bottomRight: disableBorderB ? Radius.zero : Radius.circular(radius),
    );

    BorderSide borderSide = BorderSide(width: borderWidth, color: _borderColor);
    BorderSide noBorderSide = BorderSide(width: borderWidth, color: Colors.black);
    Border border = Border(
        top: disableBorderT ? noBorderSide : borderSide,
        bottom: disableBorderB ? noBorderSide : borderSide,
        left: disableBorderL ? noBorderSide : borderSide,
        right: disableBorderR ? noBorderSide : borderSide);

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: border,
      ),
      child: child,
    );
  }
}
