import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:code_sliver/src/common/theme/custom_color.dart';
import 'package:code_sliver/src/common/theme/custom_typo.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class CommonCalendar extends ConsumerStatefulWidget {
  final DateTime? initialDate;
  final Function selectCallBack;
  final List<DateTime> additionalDisableDateList;
  final DateTime? rangeStartDate;
  final DateTime? rangeEndDate;

  const CommonCalendar({this.initialDate, required this.additionalDisableDateList, required this.selectCallBack, this.rangeStartDate, this.rangeEndDate, super.key});

  @override
  ConsumerState<CommonCalendar> createState() => _CommonCalendarState();
}

class _CommonCalendarState extends ConsumerState<CommonCalendar> {
  static List<String> weekdayListEn = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
  static List<String> weekdayListKo = ["월", "화", "수", "목", "금", "토", "일"];
  DateTime curDate = DateTime.now();
  DateTime? initialDate;

  DateTime? rangeStartDate;
  DateTime? rangeEndDate;
  List<DateTime> curRangeDate = [];

  @override
  void initState() {
    curDate = DateTime.now();
    initialDate = widget.initialDate ?? curDate;

    curDate = initialDate!;

    rangeStartDate = widget.rangeStartDate;
    rangeEndDate = widget.rangeEndDate;
    curRangeDate = [];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      headerStyle: HeaderStyle(
          leftChevronIcon: Icon(
            Icons.keyboard_arrow_left,
            color: CustomColor.sf_700,
          ),
          rightChevronIcon: Icon(
            Icons.keyboard_arrow_right,
            color: CustomColor.sf_700,
          )),
      availableGestures: AvailableGestures.horizontalSwipe,
      headerVisible: true,
      availableCalendarFormats: const {
        CalendarFormat.month: 'Month',
      },
      calendarStyle: CalendarStyle(
        isTodayHighlighted: true,
        outsideTextStyle: CustomTypo.getTypo(fontType: FontType.BODY2_T, color: CustomColor.sf_500),
        defaultTextStyle: CustomTypo.getTypo(fontType: FontType.BODY2_T, color: CustomColor.sf_800),
        holidayTextStyle: CustomTypo.getTypo(fontType: FontType.BODY2_T, color: CustomColor.sf_500),
        weekendTextStyle: CustomTypo.getTypo(fontType: FontType.BODY1, color: CustomColor.sf_pink),
        selectedDecoration: BoxDecoration(
          color: CustomColor.sf_600,
          shape: BoxShape.circle,
        ),
        rangeHighlightColor: CustomColor.sf_pink.withOpacity(0.3),
        rangeStartDecoration: BoxDecoration(
          color: CustomColor.sf_pink,
          shape: BoxShape.circle,
        ),
        rangeEndDecoration: BoxDecoration(
          color: CustomColor.sf_pink,
          shape: BoxShape.circle,
        ),

        holidayDecoration: const BoxDecoration(),
        // selectedTextStyle:
        todayTextStyle: CustomTypo.getTypo(fontType: FontType.BODY2_T, color: CustomColor.sf_800),
      ),
      firstDay: DateTime.parse('2010-01-01'),
      rangeStartDay: rangeStartDate,
      rangeEndDay: rangeEndDate,
      lastDay: DateTime.parse('2100-01-01'),
      focusedDay: curDate,
      onDaySelected: (DateTime curSelectedDay, DateTime focuseddDay) {
        if (rangeStartDate == null) {
          curRangeDate.clear();
          rangeStartDate = curSelectedDay;
          curRangeDate.add(curSelectedDay);
        } else if (rangeStartDate != null && rangeEndDate == null) {
          if (curSelectedDay.isBefore(rangeStartDate!)) {
            curRangeDate.clear();
            rangeStartDate = curSelectedDay;
            curRangeDate.add(curSelectedDay);
          } else if (curSelectedDay.isAtSameMomentAs(rangeStartDate!)) {
          } else {
            rangeEndDate = curSelectedDay;
            curRangeDate.add(curSelectedDay);
          }
        } else if (rangeStartDate != null && rangeEndDate != null) {
          curRangeDate.clear();
          rangeStartDate = curSelectedDay;
          rangeEndDate = null;
          curRangeDate.add(curSelectedDay);
        }

        // curDate = curSelectedDay;
        widget.selectCallBack(curRangeDate);
        setState(() {});
      },
      selectedDayPredicate: (DateTime sd) {
        return isSameDay(curDate, sd);
      },
      calendarBuilders: CalendarBuilders(headerTitleBuilder: (context, day) {
        return Consumer(builder: (_, ref, widget) {
          return Center(
            child: Text(
                DateFormat('M월 yyyy').format(day) ,
              style: CustomTypo.getTypo(fontType: FontType.BODY1, color: CustomColor.sf_800),
            ),
          );
        });
      }, dowBuilder: (context, day) {
        return Consumer(builder: (_, ref, widget) {
          return Center(
            child: Text(
                weekdayListKo[day.weekday - 1],
              style: CustomTypo.getTypo(fontType: FontType.BODY2_T, color: CustomColor.sf_800),
            ),
          );
        });
      }, defaultBuilder: (context, day, focusedDay) {
        Color color = CustomColor.sf_800;
        if (day.weekday == 6) {
          color = Colors.indigo;
        }
        if (day.weekday == 7) {
          color = Colors.red;
        }

        return Center(
          child: Text(day.day.toString(), style: CustomTypo.getTypo(fontType: FontType.BODY2_T, color: color)),
        );
      }
          // outsideBuilder: (context, day, focusedDay) {
          //   return Center(
          //     child: Text(
          //       day.day.toString(),
          //       style: CustomTypo.getTypo(fontType: FontType.BODY1, color: (day.weekday == 6 || day.weekday == 7) ? CustomColor.sf_500 : CustomColor.sf_800),
          //     ),
          //   );
          // },
          ),
    );
  }
}
