import 'package:intl/intl.dart';

extension DateUtil on DateTime {
  String fullDateTime() {
    return DateFormat('yyyy-MM-dd HH:mm').format(this);
  }
}
