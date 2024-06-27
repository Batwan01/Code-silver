// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/common/theme/custom_typo.dart';
import 'package:code_sliver/src/widget/bar/local_text.dart';
import 'package:intl/intl.dart';

class CustomCupertinoPicker extends StatefulWidget {
  final String label;
  final Widget child;
  final DateTime? curDateTime;
  final Function callBack;

  const CustomCupertinoPicker({required this.label, required this.child, this.curDateTime, required this.callBack, super.key});

  @override
  State<CustomCupertinoPicker> createState() => _CustomCupertinoPickerState();
}

class _CustomCupertinoPickerState extends State<CustomCupertinoPicker> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.curDateTime != null) {
      _selectedDate = widget.curDateTime;
      _selectedTime = TimeOfDay.fromDateTime(_selectedDate!);
    }
    return InkWell(
      onTap: () {
        _showDateTimePicker();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          widget.child,
        ],
      ),
    );
  }

  void _showDateTimePicker() {
    DateTime _tempDateTime = _selectedDate ?? DateTime.now();
    showCupertinoModalPopup(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          height: 380.0,
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: CupertinoDatePicker(
                  use24hFormat: true,
                  initialDateTime: _selectedDate,
                  onDateTimeChanged: (DateTime newDateTime) {
                    _tempDateTime = newDateTime;

                    log(_tempDateTime.toString());
                  },
                  mode: CupertinoDatePickerMode.time,
                ),
              ),
              //  SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: CustomColor.sf_300),
                        onPressed: () {
                          context.pop();
                        },
                        child: LocaleText(
                          text: '취소',
                          textStyle: CustomTypo.getTypo(fontType: FontType.BODY1, color: CustomColor.sf_700),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          _selectedDate = _tempDateTime;
                          _selectedTime = TimeOfDay.fromDateTime(_tempDateTime);
                          widget.callBack(_tempDateTime);
                          setState(() {});
                          context.pop();
                        },
                        child: LocaleText(
                          text: '확인',
                          textStyle: CustomTypo.getTypo(fontType: FontType.BODY1, color: CustomColor.sf_100),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
