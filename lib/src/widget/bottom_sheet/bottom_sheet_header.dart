import 'package:flutter/material.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/common/theme/custom_typo.dart';

class BottomSheetHeader extends StatelessWidget {
  final String title;
  final bool closeBtnDisable;
  final Function? onClick;
  final Widget? headerButton;
  final Widget? suffixWidget;
  final double? height;
  final EdgeInsets? padding;

  const BottomSheetHeader({
    super.key,
    this.height,
    required this.title,
    this.onClick,
    this.suffixWidget,
    this.closeBtnDisable = true,
    this.headerButton,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    Widget headerBtn = const SizedBox();

    if (headerButton != null) {
      headerBtn = Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
        child: headerButton,
      );
    } else if (!closeBtnDisable) {
      headerBtn = Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 16.0, 0),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.close),
        ),
      );
    }

    return Container(
      height: height,
      decoration: BoxDecoration(
        color: CustomColor.sf_100,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20.0),
          topLeft: Radius.circular(20.0),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10.0,
          ),
          Container(
            width: 40,
            height: 5.0,
            decoration: BoxDecoration(
              color: CustomColor.sf_400,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: padding ?? const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 24.0),
                child: InkWell(
                  onTap: () {
                    if (onClick != null) {
                      onClick!();
                    }
                  },
                  child: Row(
                    children: [
                      Text(title, style: CustomTypo.getTypo(fontType: FontType.H2_B, overrideSize: 20.0, color: CustomColor.sf_800)),
                      const SizedBox(
                        width: 4.0,
                      ),
                      suffixWidget ?? const SizedBox()
                    ],
                  ),
                ),
              ),
              headerBtn
            ],
          ),
        ],
      ),
    );
  }
}
