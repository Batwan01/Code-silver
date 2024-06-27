

import 'package:flutter/material.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';

class BlockDivider extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? color;

  const BlockDivider({this.width, this.height, this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          width: width ?? double.maxFinite,
          height: height ?? 8.0,
          color: color?? CustomColor.sf_200
        );
  }
}