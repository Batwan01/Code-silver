import 'dart:io';

import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:flutter/material.dart';
import 'package:code_sliver/src/common/theme/custom_icon.dart';
import 'package:code_sliver/src/widget/bar/bottom_navi_bar/bottom_navi_bar_item.dart';

class BottomNaviBar extends StatefulWidget {
  final Function callback;
  final int curIdx;

  const BottomNaviBar({super.key, required this.curIdx, required this.callback});

  @override
  State<BottomNaviBar> createState() => _BottomNaviBarState();
}

class _BottomNaviBarState extends State<BottomNaviBar> {
  int curSelectedIdx = 0;

  @override
  void initState() {
    super.initState();
    curSelectedIdx = widget.curIdx;
  }

  void itemClickHandler({required int idx}) {
    setState(() {
      curSelectedIdx = idx;
    });
    widget.callback(idx);
  }

  @override
  Widget build(BuildContext context) {
    curSelectedIdx = widget.curIdx;
    return Container(
      height: Platform.isIOS ? 100.0 : 75.0,
      decoration:  BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: CustomColor.sf_300,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: getBottomNaviBarItemList(),
      ),
    );
  }

  List<BottomNaviBarItem> getBottomNaviBarItemList() {
    double screenSize = MediaQuery.of(context).size.width;
    double itemSize = double.parse((screenSize / 5).toStringAsFixed(2));

    if (itemSize >= 75.0) {
      itemSize = 75.0;
    }

    List<BottomNaviBarItem> items = [
      BottomNaviBarItem(
        width: itemSize,
        label: '홈',
        padding: const EdgeInsets.all(0),
        onClick: () {
          itemClickHandler(idx: 0);
        },
        isSelected: curSelectedIdx == 0,
        iconPath: CustomIcon.iconHome,
      ),
      BottomNaviBarItem(
        width: itemSize,
        label: '일자리',
        padding: const EdgeInsets.all(0),
        onClick: () {
          itemClickHandler(idx: 1);
        },
        isSelected: curSelectedIdx == 1,
        iconPath: CustomIcon.iconJob,
      ),
      BottomNaviBarItem(
        width: itemSize,
        label: '메시지',
        padding: const EdgeInsets.all(0),
        onClick: () {
          itemClickHandler(idx: 2);
        },
        isSelected: curSelectedIdx == 2,
        iconPath: CustomIcon.iconChat,
      ),
      BottomNaviBarItem(
        width: itemSize,
        label: '프로필',
        padding: const EdgeInsets.all(0),
        onClick: () {
          itemClickHandler(idx: 3);
        },
        isSelected: curSelectedIdx == 3,
        iconPath: CustomIcon.iconProfile,
      ),
    ];
    return items;
  }
}
