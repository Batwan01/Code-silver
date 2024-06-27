import 'package:flutter/material.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/widget/bottom_sheet/bottom_sheet_header.dart';
import 'package:code_sliver/src/widget/bottom_sheet/scaffold_bottom_sheet.dart';

class BottomSheetUtil {
  static Future<void> openScaffoldBottomSheet({
    required BuildContext context,
    required BottomSheetHeader bottomSheetHeader,
    required List<Widget> innerWidgetList,
    Widget? bottomButton,
    Function? onWillPop,
    bool disableBtn = false,
    bool isDismissible = false,
    bool scaffoldFixed = true,
    bool isScrollControlled = true,
    required Function closeCallback,
  }) async {
    showModalBottomSheet(
        context: context,
        barrierColor: CustomColor.sf_bg,
        backgroundColor: Colors.transparent,
        enableDrag: true,
        isScrollControlled: isScrollControlled,
        builder: (context) {
          return ScaffoldBottomSheet(
            onWillPop: onWillPop,
            isDismissible: isDismissible,
            scaffoldFixed: scaffoldFixed,
            disableButton: disableBtn,
            closeCallback: closeCallback,
            bottomSheetHeader: bottomSheetHeader,
            innerWidgetList: innerWidgetList,
            bttomButtonWidget: bottomButton,
          );
        }).whenComplete(() {
      closeCallback();
    });
  }
}
