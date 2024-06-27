import 'package:fluttertoast/fluttertoast.dart';

class WillPopHandler {
  static DateTime currentBackPressTime = DateTime.now();

  static Future<bool> onWillPop() async {
    if (DateTime.now().difference(currentBackPressTime) > const Duration(seconds: 2)) {
      currentBackPressTime = DateTime.now();
      Fluttertoast.showToast(msg: '한번더 누르면 종료됩니다.');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
