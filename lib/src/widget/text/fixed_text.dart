import 'package:flutter/material.dart';
import 'package:code_sliver/src/widget/bar/local_text.dart';

class FixedText extends StatelessWidget {
  final String text;
  final TextStyle style;
  final bool isLocale;

  const FixedText(this.text, {required this.style, this.isLocale = false, super.key});

  @override
  Widget build(BuildContext context) {
    return isLocale? LocaleText(text: text, textStyle: style,   textScaleFactor: 1.0,) : Text(
      text,
      style: style,
      textScaleFactor: 1.0,
    );
  }
}
