import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarDialog {
  late CalendarController _calendarController;

  CalendarDialog() {
    _calendarController = CalendarController();
  }

  Future<void> dialogBuilder(BuildContext context) {
    return showModalBottomSheet<void>(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Select a date'),
          content: SizedBox(
            width: double.maxFinite,
            child: SfCalendar(
              controller: _calendarController,
              view: CalendarView.month,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
