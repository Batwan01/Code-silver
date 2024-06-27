import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/widget/bottom_sheet/bottom_sheet_header.dart';

class ScaffoldBottomSheet extends StatelessWidget {
  final bool disableButton;
  final Function closeCallback;
  final bool isDismissible;
  final bool scaffoldFixed;
  final Function? onWillPop;
  final BottomSheetHeader bottomSheetHeader;
  final List<Widget> innerWidgetList;
  final Widget? bttomButtonWidget;
  const ScaffoldBottomSheet({
    this.disableButton = false,
    required this.closeCallback,
    this.scaffoldFixed = false,
    this.onWillPop,
    required this.bottomSheetHeader,
    required this.innerWidgetList,
    this.isDismissible = false,
    this.bttomButtonWidget,
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


    return WillPopScope(
      onWillPop: () async {
        if (onWillPop != null) {
          onWillPop!();
        } else {
          context.pop();
        }
        return false;
      },
      child: GestureDetector(
        onTap: () {
          if (isDismissible) {
            context.pop();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: !scaffoldFixed,
          backgroundColor: Colors.transparent,
          body:  MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: deviceTextScaleFactor,
          ),
            child: GestureDetector(
              onTap: () {},
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    bottomSheetHeader,
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 220),
                      child: Stack(
                        children: [
                          Container(
                            color: CustomColor.sf_100,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  ...innerWidgetList,
                                  !disableButton
                                      ? const SizedBox(
                                          height: 80,
                                        )
                                      : const SizedBox(),
                                ],
                              ),
                            ),
                          ),
                          !disableButton
                              ? Positioned(
                                  bottom: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: [const Color(0x00FFFFFF), const Color(0xFFFFFFFF), CustomColor.sf_100],
                                            // colors: [DgdrColor.black, Color(0xFFFFFFFF), DgdrColor.white],
                                            begin: Alignment.topCenter,
                                            end: Alignment.center)),
                                    width: MediaQuery.of(context).size.width,
                                    // height: 94.0,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(16.0, 12, 16.0, 20.0),
                                      child: bttomButtonWidget ?? const SizedBox(),
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
