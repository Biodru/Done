import 'package:intl/intl.dart';

class DateUtility {
  static String getDateText(DateTime date) {
    final df = DateFormat('dd/MM/yyyy HH:mm');
    return df.format(date);
  }

  static String test(DateTime date) {
    final df = DateFormat('EEEE HH:mm');
    return df.format(date);
  }
}
