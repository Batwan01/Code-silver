import 'package:intl/intl.dart';

class TimeUtil {
  static final List<String> koreanWeekdays = ['일', '월', '화', '수', '목', '금', '토', '일'];

  ///
  /// 타이머 시간 formmator:: second -> mm:ss
  static String getTime({required int curTime}) {
    int mm = curTime ~/ 60;
    int ss = curTime % 60;

    String secStr;

    if (ss == 0) {
      secStr = '00';
    } else if (ss < 10) {
      secStr = '0$ss';
    } else {
      secStr = ss.toString();
    }

    String timeStr = '$mm:$secStr';
    return timeStr;
  }

  static int calcDiffDay({required DateTime targetDateTime, required DateTime baseDateTime}) {
    DateTime givenDateTime = targetDateTime;
    DateTime now = baseDateTime;

    Duration difference = givenDateTime.difference(now); // 차이 계산
    int daysDifference = difference.inDays + 1; // 차이를
    return daysDifference;
  }

  static String convertMdEStr({required DateTime dateTime}) {
    final DateFormat formatter = DateFormat('M월 d일');
    final String dayOfWeek = koreanWeekdays[dateTime.weekday];

    return '${formatter.format(dateTime)} ($dayOfWeek)';
  }

  static String convertYYYYMMDDEStr({required DateTime? dateTime}) {
    if(dateTime == null) return "";
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String dayOfWeek = koreanWeekdays[dateTime.weekday];

    return '${formatter.format(dateTime)} ($dayOfWeek)';
  }

  static String convertYYYYMMDDStr({required DateTime? dateTime}) {
    if(dateTime == null) return "";
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(dateTime);
  }

  static String convertYYYYMMDDTimeStr({required DateTime dateTime}) {
    final DateFormat formatter  = DateFormat("yyyy-MM-dd HH:mm:ss");
    return formatter.format(dateTime);
  }

  static String convertYYYY_MM_DDEStr({required DateTime dateTime}) {
    final DateFormat formatter = DateFormat('yyyy.MM.dd');
    final String dayOfWeek = koreanWeekdays[dateTime.weekday];

    return '${formatter.format(dateTime)} ($dayOfWeek)';
  }

  static bool isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
