import 'package:flutter/widgets.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const CustomText(this.text, {required this.style, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
