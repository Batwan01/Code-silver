import 'package:flutter/material.dart';
import 'package:code_sliver/src/widget/text/fixed_text.dart';

class TextBadge extends StatelessWidget {
  final Color backgroundColor;
  final TextStyle textStyle;
  final String text;
  final double height;
  final double radius;
  final EdgeInsets? overridePadding;
  final bool isLocale;

  const TextBadge({
    this.height = 30.0,
    this.radius = 5.0,
    required this.text,
    required this.backgroundColor,
    required this.textStyle,
    this.overridePadding,
    this.isLocale = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        height: height,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius), color: backgroundColor),
        child: Padding(
          padding: overridePadding ?? const EdgeInsets.fromLTRB(7.0, 0, 7.0, 0),
          child: Center(child: FixedText(text, style: textStyle, isLocale: isLocale)),
        ),
      ),
    );
  }
}
