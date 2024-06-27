import 'package:flutter/material.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/widget/bar/app_bar/top_app_bar_btn.dart';

class TopAppBar {
  final double height;
  final Color color;
  final Widget title;
  final List<TopAppBarBtn>? actionBtnList;
  final bool isLeading;
  final Widget? leadingIcon;
  final Function? leadingCallback;

  TopAppBar({
    this.height = 52.0,
    required this.color,
    required this.title,
    this.actionBtnList,
    this.leadingIcon,
    this.isLeading = true,
    this.leadingCallback,
  });

  AppBar get get => AppBar(
      elevation: 0,
      toolbarHeight: height,
      centerTitle: true,
      titleSpacing: 0,
      title: title,
      backgroundColor: color,
      foregroundColor: CustomColor.sf_black,
      automaticallyImplyLeading: isLeading,

      leading: isLeading
          ? GestureDetector(
              onTap: () {
                if (leadingCallback != null) leadingCallback!();
              },
              child: leadingIcon ?? const SizedBox(),
            )
          : null,
      actions: actionBtnList != null ? [...actionBtnList!, const SizedBox(width: 12.0,)] : []);
}
