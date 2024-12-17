import 'package:intl/intl.dart';

String dateFormate(String date, {String? inFormate = 'dd-MM-yyyy, HH:mm'}) {
  if (date.isEmpty) {
    return "";
  }
  String formatted = '';
  try {
    DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat(inFormate ?? 'dd-MM-yyyy, HH:mm');

    // HH:mm');
    formatted = formatter.format(dateTime);
  } catch (e) {
    formatted = e.toString();
  }

  return formatted;
}
