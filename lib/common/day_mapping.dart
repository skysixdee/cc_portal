import 'package:cc_portal/utilily/strings.dart';

String daysMapping(String value) {
  if (value == '0' || value == '1') {
    return " $dayStr";
  } else {
    return " $daysStr";
  }
}
