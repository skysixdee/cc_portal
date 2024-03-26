import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPopover extends StatefulWidget {
  @override
  _CalendarPopoverState createState() => _CalendarPopoverState();
}

class _CalendarPopoverState extends State<CalendarPopover> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ResponsiveBuilder(builder: (context, sizingInformation) {
        return SingleChildScrollView(
          child: InkWell(
            onTap: () {
              showPopover(
                context: context,
                transitionDuration: const Duration(milliseconds: 150),
                arrowHeight: 7,
                arrowWidth: 15,
                bodyBuilder: (context) => Container(
                  width: 200,
                  height: 290,
                  padding: EdgeInsets.all(5),
                  child: TableCalendar(
                    firstDay: DateTime.utc(2010, 10, 16),
                    lastDay: DateTime.utc(2030, 3, 14),
                    focusedDay: DateTime.now(),
                    rowHeight: 33,
                    calendarStyle: CalendarStyle(
                      cellMargin: EdgeInsets.zero,
                      outsideDaysVisible: false,
                    ),
                    availableGestures: AvailableGestures.none,
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    calendarBuilders: CalendarBuilders(
                      selectedBuilder: (context, date, _) => Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor,
                        ),
                        child: Text(
                          '${date.day}',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                onPop: () => print('Popover was popped!'),
                direction: PopoverDirection.top,
                width: 290,
                height: 290,
              );
            },
            child: Icon(Icons.calendar_month),
          ),
        );
      }),
    );
  }
}







// class CalendarPopoverDemo extends StatefulWidget {
//   @override
//   _CalendarPopoverDemoState createState() => _CalendarPopoverDemoState();
// }

// class _CalendarPopoverDemoState extends State<CalendarPopoverDemo> {
//   DateTime _focusedDay = DateTime.now();
//   DateTime _selectedDay = DateTime.now();

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: InkWell(
//         onTap: () {
//           showPopover(
//             context: context,
//             transitionDuration: const Duration(milliseconds: 150),
//             bodyBuilder: (context) => Container(
//               width: 200, // Adjusted width
//               height: 200, // Reduced height
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       DropdownButton<int>(
//                         value: _focusedDay.month,
//                         items: List.generate(12, (index) => index + 1)
//                             .map((int value) {
//                           return DropdownMenuItem<int>(
//                             value: value,
//                             child: Text('${DateTime(2000, value).month}'),
//                           );
//                         }).toList(),
//                         onChanged: (int? newValue) {
//                           setState(() {
//                             _focusedDay = DateTime(
//                               _focusedDay.year,
//                               newValue!,
//                               _focusedDay.day,
//                             );
//                           });
//                         },
//                       ),
//                       DropdownButton<int>(
//                         value: _focusedDay.year,
//                         items: List.generate(30, (index) => index + 2021)
//                             .map((int value) {
//                           return DropdownMenuItem<int>(
//                             value: value,
//                             child: Text('$value'),
//                           );
//                         }).toList(),
//                         onChanged: (int? newValue) {
//                           setState(() {
//                             _focusedDay = DateTime(
//                               newValue!,
//                               _focusedDay.month,
//                               _focusedDay.day,
//                             );
//                           });
//                         },
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 8),
//                   TableCalendar(
//                     firstDay: DateTime.utc(2010, 10, 16),
//                     lastDay: DateTime.utc(2030, 3, 14),
//                     focusedDay: _focusedDay,
//                     selectedDayPredicate: (day) {
//                       return isSameDay(_selectedDay, day);
//                     },
//                     onDaySelected: (selectedDay, focusedDay) {
//                       setState(() {
//                         _selectedDay = selectedDay;
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             onPop: () => print('Popover was popped!'),
//             direction: PopoverDirection.top,
//             width: 290,
//             height: 290, // Adjusted height of the entire popover
//             arrowHeight: 15,
//             arrowWidth: 30,
//           );
//         },
//         child: Icon(Icons.calendar_today),
//       ),
//     );
//   }
// }
