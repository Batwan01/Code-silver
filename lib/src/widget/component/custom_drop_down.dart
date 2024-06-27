import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/common/theme/custom_typo.dart';
import 'package:code_sliver/src/widget/bar/local_text.dart';
import 'package:code_sliver/src/widget/component/block_divider.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> itemList;
  final Function onChange;
  final String curSelectValue;
  final Widget? title;
  final double width;
  final Offset? offset;
  final EdgeInsets? padding;

  const CustomDropDown({
    this.title,
    required this.itemList,
    required this.onChange,
    required this.curSelectValue,
    this.padding,
    this.offset,
    this.width = 120.0,
    super.key,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String curSelectValue = "";

  @override
  void initState() {
    curSelectValue = widget.itemList[0];

    if (widget.curSelectValue != "") {
      curSelectValue = widget.curSelectValue;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton2(
      customButton: widget.title,
      dropdownStyleData: DropdownStyleData(
        offset: widget.offset ?? Offset.zero,
        padding: widget.padding ?? EdgeInsets.zero,
        width: widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 8,
      ),
      menuItemStyleData: MenuItemStyleData(
        padding: EdgeInsets.zero,
        customHeights: _getCustomItemsHeights(widget.itemList),
      ),
      underline: const SizedBox(),
      value: curSelectValue,
      items: _addDividersAfterItems(widget.itemList),
      onChanged: (e) {
        widget.onChange(e);
        setState(() {
          curSelectValue = e!;
        });
      },
    );
  }

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> _menuItems = [];
    for (var item in items) {
      _menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Container(
              color: widget.curSelectValue == item ? CustomColor.sf_pink.withOpacity(0.5) : CustomColor.sf_100,
              child: Center(
                child: LocaleText(
                  text: item,
                  textStyle: CustomTypo.getTypo(fontType: FontType.BODY2_T, overrideSize: 14.0, overrideWeight: FontWeight.w300, color: CustomColor.sf_800),
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            DropdownMenuItem<String>(
                enabled: false,
                child: BlockDivider(
                  height: 1,
                  color: CustomColor.sf_300,
                )),
        ],
      );
    }
    return _menuItems;
  }

  List<double> _getCustomItemsHeights(List<String> items) {
    List<double> _itemsHeights = [];
    for (var i = 0; i < (items.length * 2) - 1; i++) {
      if (i.isEven) {
        _itemsHeights.add(30);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        _itemsHeights.add(1);
      }
    }
    return _itemsHeights;
  }
}
