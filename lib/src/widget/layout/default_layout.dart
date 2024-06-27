import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:code_sliver/src/widget/bar/app_bar/top_app_bar.dart';

class DefaultLayout extends StatelessWidget {
  final TopAppBar? topAppBar;
  final Widget child;
  final Color? bgColor;
  final bool? resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;

  const DefaultLayout({
    this.topAppBar,
    required this.child,
    this.bgColor,
    this.resizeToAvoidBottomInset,
    this.extendBodyBehindAppBar = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double deviceTextScaleFactor = MediaQuery.of(context).textScaleFactor;

    if (deviceTextScaleFactor > 1.0) {
      deviceTextScaleFactor = 1.2;
    } else {
      deviceTextScaleFactor = 1.0;
    }

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: deviceTextScaleFactor,
      ),
      child: Scaffold(
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        appBar: topAppBar != null ? topAppBar!.get : null,
        backgroundColor: bgColor,
        body: child,
      ),
    );
  }
}
