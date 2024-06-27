import 'package:flutter/material.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/common/theme/custom_icon.dart';
import 'package:code_sliver/src/common/theme/custom_typo.dart';

class BottomNaviBarItem extends StatelessWidget {
  final double width;
  final EdgeInsets padding;
  final bool isSelected;
  final String label;
  final String iconPath;
  final Function onClick;

  const BottomNaviBarItem({
    super.key,
    required this.isSelected,
    required this.padding,
    required this.iconPath,
    required this.label,
    required this.width,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    double deviceTextScaleFactor = MediaQuery.of(context).textScaleFactor;

    if (deviceTextScaleFactor > 1.0) {
      deviceTextScaleFactor = 1.15;
    } else {
      deviceTextScaleFactor = 1.0;
    }

    Color curColor = isSelected ? CustomColor.sf_green : CustomColor.sf_400;

    return InkWell(
      onTap: () => onClick(),
      child: SizedBox(
        width: width,
        child: Padding(
          padding: padding,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              isSelected ?
          CustomIcon.get(path: iconPath, color: curColor, scale: 1.0)
                  : CustomIcon.get(path: iconPath, color: curColor, scale: 1.0),
              const SizedBox(height: 2.0),
              Text(label, style: CustomTypo.getTypo(fontType: FontType.BODY2, color: curColor,),textScaleFactor: deviceTextScaleFactor,)
            ],
          ),
        ),
      ),
    );
  }
}
