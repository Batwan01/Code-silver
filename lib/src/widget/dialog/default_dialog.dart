import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/common/theme/custom_typo.dart';

class DefaultDialog extends StatelessWidget {
  final Widget title;
  final Widget content;
  final Widget? button;
  final String confirmBtnLabel;
  final Function? callBack;
  final Function? cancelCallBack;
  final bool cancleBtnVisible;

  const DefaultDialog(
      {required this.title, this.confirmBtnLabel = "", this.cancleBtnVisible = false, this.callBack, required this.content, this.button, super.key, this.cancelCallBack});

  @override
  Widget build(BuildContext context) {
    double deviceTextScaleFactor = MediaQuery.of(context).textScaleFactor;

    if (deviceTextScaleFactor > 1.0) {
      deviceTextScaleFactor = 1.2;
    } else {
      deviceTextScaleFactor = 1.0;
    }

    return Center(
      child: Container(
        width: 310.0,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(
              textScaleFactor: deviceTextScaleFactor,
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  title,
                  const SizedBox(
                    height: 4.0,
                  ),
                  content,
                  const SizedBox(
                    height: 20.0,
                  ),
                  button ??
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          if (cancleBtnVisible) ...[
                            SizedBox(
                              child: InkWell(
                                onTap: () {
                                  if (cancelCallBack != null) {
                                    cancelCallBack!();
                                  } else {
                                    context.pop();
                                  }
                                },
                                child: Text(
                                  '취소',
                                  style: CustomTypo.getTypo(fontType: FontType.BODY1_B, color: CustomColor.sf_700, overrideSize: 15.0),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 8.0,
                            ),
                          ],
                          SizedBox(
                            child: InkWell(
                              onTap: () {
                                if (callBack != null) {
                                  callBack!();
                                } else {
                                  context.pop();
                                }
                              },
                              child: Text(
                                confirmBtnLabel == "" ? '확인' : confirmBtnLabel,
                                style: CustomTypo.getTypo(fontType: FontType.BODY1_B, color: CustomColor.sf_green, overrideSize: 15.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                  const SizedBox(
                    height: 16.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
