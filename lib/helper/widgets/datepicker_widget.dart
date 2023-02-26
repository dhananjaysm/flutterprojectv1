import 'package:flutter/material.dart';
import 'package:mileazofltr/utils/app_style.dart';

class StatefulDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final ValueChanged<DateTime> onDateChanged;

  const StatefulDatePicker(
      {super.key, required this.initialDate, required this.onDateChanged});

  @override
  _StatefulDatePickerState createState() => _StatefulDatePickerState();
}

class _StatefulDatePickerState extends State<StatefulDatePicker> {
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: kPrimaryColor,
      icon: const Icon(Icons.calendar_month),
      onPressed: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2023),
          lastDate: DateTime(2050),
        );

        if (pickedDate != null) {
          setState(() {
            _selectedDate = pickedDate;
          });
          widget.onDateChanged(_selectedDate);
        }
      },
    );
  }
}
