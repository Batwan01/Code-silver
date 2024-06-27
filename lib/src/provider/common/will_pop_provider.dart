import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

final willPopProvider = StateNotifierProvider<WillPopProvider, void>((ref) => WillPopProvider());

class WillPopProvider extends StateNotifier<void> {
  DateTime? lastClickTime;
  int clickCount = 0;

  WillPopProvider() : super(null);

  void initValue() {
    lastClickTime = null;
    clickCount = 0;
  }

  Future<bool> twiceBackAppOutHandler({required BuildContext context}) async {
    DateTime now = DateTime.now();
    if (lastClickTime == null || now.difference(lastClickTime!) > const Duration(seconds: 2)) {
      lastClickTime = now;
      clickCount++;
      Fluttertoast.showToast(msg: "한번더 누르면 종료됩니다.");
    } else {
      if (now.difference(lastClickTime!) <= const Duration(seconds: 2)) {
        initValue();
        SystemNavigator.pop();
      } else {
        initValue();
      }
    }

    return true;
  }
}
