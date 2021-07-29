import 'package:intl/intl.dart';

class DataUtils {
  static String numberFormat(double? val) {
    return NumberFormat("###,###,###,###").format(val);
  }

  static String simpleDayFormat(DateTime time) {
    return DateFormat('MM.dd').format(time);
  }
}
