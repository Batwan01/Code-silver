import 'package:flutter/material.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/common/theme/custom_typo.dart';

class CustomSnackbar {
  static void successSnackbar({required BuildContext context, required String msg, bool topFlag = false, Duration? duration}) {
    SnackBar snackbar = SnackBar(
      margin: topFlag ? EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 150, left: 10, right: 10) : null,
      dismissDirection: topFlag ? DismissDirection.up : DismissDirection.down,
      content: SizedBox(
        child: Row(
          children: [
            Transform.scale(
              scale: 0.8,
              child: Icon(
                Icons.info_outline,
                color: CustomColor.sf_green,
              ),
            ),
            Flexible(
              child: Text(
                msg,
                style: TextStyle(color: CustomColor.sf_green),
                overflow: TextOverflow.fade,
                textScaleFactor: 1.0,
              ),
            )
          ],
        ),
      ),
      duration: duration ?? const Duration(seconds: 1, milliseconds: 600),
      // margin: const EdgeInsets.all(16).r,
      behavior: SnackBarBehavior.floating,
      backgroundColor: CustomColor.sf_green_sub3,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    Future.delayed(Duration.zero).then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbar));
  }

  static void warnSnackbar({required BuildContext context, required String msg, bool topFlag = false}) {
    SnackBar snackbar = SnackBar(
      margin: topFlag ? EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 150, left: 10, right: 10) : null,
      dismissDirection: topFlag ? DismissDirection.up : DismissDirection.down,
      content: SizedBox(
        child: Row(
          children: [
            Transform.scale(
              scale: 0.8,
              child: Icon(
                Icons.error,
                color: CustomColor.sf_red,
              ),
            ),
            Flexible(
              child: Text(
                msg,
                style: CustomTypo.getTypo(fontType: FontType.BODY1, color: CustomColor.sf_red, overrideLineheight: 1.1),
                textScaleFactor: 1.0,
              ),
            )
          ],
        ),
      ),
      duration: const Duration(seconds: 3),
      // margin: const EdgeInsets.all(16).r,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.red[100],
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    );
    ScaffoldMessenger.of(context).clearSnackBars();
    Future.delayed(Duration.zero).then((value) => ScaffoldMessenger.of(context).showSnackBar(snackbar));
  }
}
