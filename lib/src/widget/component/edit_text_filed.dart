// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/common/theme/custom_icon.dart';
import 'package:code_sliver/src/common/theme/custom_typo.dart';
import 'package:code_sliver/src/common/util/formatter/mask_formatter.dart';

class EditTextFiled extends StatefulWidget {
  final String label;
  final String placeholder;
  final TextEditingController textEditingController;
  final int maxLines;
  final bool paddingFlag;
  final bool isWarn;
  final String warnText;
  final TextInputType type;
  final Widget? prefixIcon;
  final String? prefixIconPath;
  final bool suffixFlag;
  final Widget? suffixWidget;
  final Function? suffixFunction;
  final bool suffixAlwaysShow;
  final bool disableFlag;
  final bool borderFlag;
  final int? maxLength;
  final Function? onChange;
  final Function? onSubmit;
  final Function? onFocusIn;
  final Function? onFocusOut;
  final bool requiredFlag;
  final bool secretFlag;
  final FocusNode?  focus;
  final List<TextInputFormatter>? formatterList;
  final Color? backgroundColor;
  final double? height;

  const EditTextFiled({
    required this.label,
    required this.placeholder,
    required this.textEditingController,
    this.paddingFlag = true,
    this.borderFlag = true,
    this.maxLines = 1,
    super.key,
    this.type = TextInputType.text,
    this.isWarn = false,
    this.warnText = "",
    this.prefixIcon,
    this.prefixIconPath,
    this.suffixWidget,
    this.suffixFlag = false,
    this.suffixAlwaysShow = false,
    this.suffixFunction,
    this.maxLength,
    this.onChange,
    this.onSubmit,
    this.onFocusIn,
    this.onFocusOut,
    this.disableFlag = false,
    this.requiredFlag = false,
    this.secretFlag = false,
    this.focus,
    this.formatterList,
    this.backgroundColor,
    this.height
  });

  @override
  State<EditTextFiled> createState() => _EditTextState();
}

class _EditTextState extends State<EditTextFiled> {
  late FocusNode focusNode;
  bool isFocusing = false;

  @override
  void initState() {
    focusNode = widget.focus?? FocusNode();
    isFocusing = false;

    focusHandler(focusNode: focusNode);

    if (widget.type == TextInputType.phone) {
      widget.textEditingController.text = MaskFormatter("000-0000-0000").applyMask(widget.textEditingController.text).text;
    }
    super.initState();
  }

  void focusHandler({required FocusNode focusNode}) {
    focusNode.addListener(
      () {
        if (!focusNode.hasFocus) {
          if (widget.onFocusOut != null) {
            widget.onFocusOut!(widget.textEditingController.text);
          }
          setState(() {
            isFocusing = false;
          });
          focusNode.unfocus();
        }
      },
    );
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: widget.disableFlag,
      child: Padding(
        padding: widget.paddingFlag ? const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0) : const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != "") ...[
              Row(
                children: [
                  Text(widget.label, style: CustomTypo.getTypo(fontType: FontType.BODY1_B, color: CustomColor.sf_black)),
                  if (widget.requiredFlag) ...[
                    const SizedBox(
                      width: 2.0,
                    ),
                    Text('*', style: CustomTypo.getTypo(fontType: FontType.BODY1_B, color: CustomColor.sf_red)),
                  ]
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
            SizedBox(
              height:widget.height ?? 50.0 + ((widget.maxLines -1) *5),
              child: TextFormField(
                maxLength: widget.maxLength,
                focusNode: focusNode,
                enabled: !widget.disableFlag,
                autofocus: false,
                maxLines: widget.maxLines,
                controller: widget.textEditingController,
                enableSuggestions: false,
                cursorColor: CustomColor.sf_green,
                style: CustomTypo.getTypo(
                  fontType: FontType.BODY2_T,
                  color: CustomColor.sf_black,
                  overrideLineheight: 1.1
                ),
                keyboardType: widget.type,
                obscureText: widget.type == TextInputType.visiblePassword ? true :  widget.secretFlag,
                decoration: genInputDecoration(),
                inputFormatters: widget.formatterList ?? getFormatters(),
                onChanged: (value) {
                  if (widget.onChange != null) {
                    widget.onChange!(value);
                  }
                },
                onTap: () {
                  if (widget.onFocusIn != null) {
                    widget.onFocusIn!();
                  }
                  setState(() {
                    isFocusing = true;
                  });
                },
              ),
            ),
            if (widget.isWarn) ...[
              const SizedBox(
                height: 8.0,
              ),
              Text(widget.warnText, style: CustomTypo.getTypo(fontType: FontType.BODY2, color: CustomColor.sf_red)),
            ]
          ],
        ),
      ),
    );
  }

  InputDecoration genInputDecoration() {
    return InputDecoration(
      prefixIcon: widget.prefixIcon,
      hintText: widget.placeholder,
      hintStyle: CustomTypo.getTypo(fontType: FontType.BODY1, color: CustomColor.sf_500),
      border:  OutlineInputBorder(
        borderSide: BorderSide(width:  1, color:  widget.borderFlag?  CustomColor.sf_400: Colors.transparent),
        borderRadius: BorderRadius.circular(8),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color:  widget.borderFlag? CustomColor.sf_400 : Colors.transparent),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color:  widget.borderFlag? CustomColor.sf_green: Colors.transparent, strokeAlign: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      hintMaxLines: 1,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      fillColor: widget.disableFlag ? CustomColor.sf_300 : widget.backgroundColor ?? CustomColor.sf_white,
      contentPadding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
      suffixIcon: widget.suffixFlag ? getSuffixIcon() : null,
      counterText: "",

    );
  }

  List<TextInputFormatter> getFormatters() {
    TextInputType _type = widget.type;

    if (_type == TextInputType.phone) {
      return [MaskFormatter("000-0000-0000")];
    }

    if (_type == TextInputType.number) {
      return [FilteringTextInputFormatter.digitsOnly];
    }

    return [];
  }

  Widget getSuffixIcon() {
    Widget _suffixWiget = const SizedBox();

    if (!widget.suffixAlwaysShow && !isFocusing && widget.textEditingController.text == '') {
      return _suffixWiget;
    }

    if (widget.suffixWidget == null) {
      _suffixWiget = InkWell(
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () {
          widget.textEditingController.clear();
        },
        child: Visibility(
          visible: isFocusing,
          child: Icon(Icons.close_rounded, color: CustomColor.sf_500,)
        ),
      );
    } else {
      _suffixWiget = InkWell(
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (widget.suffixFunction != null) {
              widget.suffixFunction!();
            }
          },
          child: widget.suffixWidget);
    }

    return _suffixWiget;
  }
}
