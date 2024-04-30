import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class DatePickerUtils {
  Future<DateTime?> showDatePickerDialog(BuildContext context,
      DateTime? selectedDate, DateTime? firstDate, DateTime? lastDate) async {
    final DateTime? selected = await showDatePicker(
        context: context,
        initialDate: selectedDate ?? DateTime.now(),
        firstDate: firstDate ?? DateTime(1950),
        lastDate: lastDate ?? DateTime.now(),
        builder: (context, child) => Theme(
            data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  onSurface: Colors.black26,
                ),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(foregroundColor: Colors.grey))),
            child: child!));
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
      String formattedDate = DateFormat('dd-MM-yyyy').format(selected);
    }
    return selected;
  }
}
