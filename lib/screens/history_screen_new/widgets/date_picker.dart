import 'package:flutter/material.dart';
import 'package:cc_portal/utilily/colors.dart';
import 'package:cc_portal/enums/font_name.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class DatePicker extends StatefulWidget {
  DatePicker({super.key, this.onConfirm, required this.startDateTime});
  final DateTime startDateTime; // = DateTime.now();
  DateTime selectedDateTime = DateTime.now();
  final Function(DateTime)? onConfirm;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  bool isOpened = false;
  @override
  Widget build(BuildContext context) {
    return calender(context);
  }

  Widget calender(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(border: Border.all(color: greyLight)),
      child: SfCalendar(
        cellBorderColor: greyLight,
        headerStyle: headerStyle(),
        viewHeaderStyle: viewHeaderStyle(),
        monthViewSettings: _monthCellDecoration(),
        selectionDecoration: dateSectionDecoration(),
        initialSelectedDate: widget.startDateTime,
        onSelectionChanged: (csd) {
          widget.selectedDateTime = DateTime(
            csd.date?.year ?? 0,
            csd.date?.month ?? 0,
            csd.date?.day ?? 0,
            widget.startDateTime.hour,
            widget.startDateTime.minute,
          );
          if (widget.onConfirm != null) {
            if (isOpened) {
              Navigator.of(context).pop();
              widget.onConfirm!(widget.selectedDateTime);
            }

            isOpened = true;
          }
        },
        todayTextStyle: TextStyle(color: black, fontFamily: FontName.bold.name),
        firstDayOfWeek: 7,
        view: CalendarView.month,
        initialDisplayDate: widget.startDateTime,
        todayHighlightColor: sixdColor,
        showDatePickerButton: true,
        showCurrentTimeIndicator: true,
        showNavigationArrow: true,
        minDate: DateTime(1980, 03, 05, 10, 0, 0), //DateTime.now(),
        maxDate: DateTime.now(), //DateTime(2080, 03, 05, 10, 0, 0),
      ),
    );
  }

  CalendarHeaderStyle headerStyle() {
    return CalendarHeaderStyle(
      textStyle:
          TextStyle(color: black, fontSize: 16, fontFamily: FontName.bold.name),
      textAlign: TextAlign.center,
    );
  }

  ViewHeaderStyle viewHeaderStyle() {
    return ViewHeaderStyle(
        dayTextStyle: TextStyle(fontFamily: FontName.bold.name),
        dateTextStyle: dateTextStyle());
  }

  TextStyle dateTextStyle() =>
      TextStyle(color: black, fontFamily: FontName.bold.name);

  BoxDecoration dateSectionDecoration() {
    return BoxDecoration(
        color: sixdColor.withOpacity(0.3),
        border: Border.all(color: red, width: 3),
        borderRadius: BorderRadius.circular(4));
  }

  MonthViewSettings _monthCellDecoration() {
    return MonthViewSettings(
      showAgenda: false,
      monthCellStyle: MonthCellStyle(
          textStyle:
              TextStyle(fontFamily: FontName.bold.name, color: Colors.black),
          leadingDatesTextStyle:
              TextStyle(fontFamily: FontName.bold.name, color: Colors.grey),
          trailingDatesTextStyle:
              TextStyle(fontFamily: FontName.bold.name, color: Colors.grey)),
    );
  }
}
