class CurrencyMask {
  static RegExp numExp = RegExp(r'\B(?=(\d{3})+(?!\d))');

  static String getKorCurrencyMask({required int source}) {
    String maskedStr = "";

    int million = source ~/ 100000000;
    int etcMillion = source % 100000000;
    int tenThousand = etcMillion ~/ 10000;
    int etcTenThousand = etcMillion % 10000;

    if (million != 0) {
      maskedStr = "${getNumMask(source: million)}억";
    }
    if (tenThousand != 0) {
      maskedStr += " ${getNumMask(source: tenThousand)}만";
    }
    if (etcTenThousand != 0) {
      maskedStr += " ${getNumMask(source: etcTenThousand)} 원";
    } else {
      maskedStr = "$maskedStr 원";
    }
    if (source == 0) {
      maskedStr = "0 원";
    }

    return maskedStr.trimLeft();
  }

  ///
  /// isSpan == true :: ' 원'
  static String getNumMask({required int source, bool isSpan = false}) {
    String maskedStr;
    maskedStr = source.toString().replaceAll(numExp, ',');
    return isSpan ? '$maskedStr 원' : maskedStr;
  }
}
