import 'package:flutter/material.dart';

class TopAppBarBtn extends StatelessWidget {
  final Widget icon;
  final Function onClick;
  const TopAppBarBtn({super.key, required this.icon, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onClick();
        },
        child: icon);
  }
}
