import 'package:intl/intl.dart';

String dateFormate(String date) {
  if (date.isEmpty) {
    return "";
  }
  String formatted = '';
  try {
    DateTime dateTime = DateTime.parse(date);
    final DateFormat formatter = DateFormat('dd-MM-yyyy, HH:mm');

    // HH:mm');
    formatted = formatter.format(dateTime);
  } catch (e) {
    formatted = e.toString();
  }

  return formatted;
}
