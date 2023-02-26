import 'package:flutter/material.dart';
import 'package:mileazofltr/utils/app_layout.dart';

class StatefulCheckbox extends StatefulWidget {
  final String title;
  final bool value;
  final void Function(dynamic) onChanged;

  const StatefulCheckbox(
      {super.key,
      required this.title,
      required this.value,
      required this.onChanged});

  @override
  State<StatefulCheckbox> createState() => _StatefulCheckboxState();
}

class _StatefulCheckboxState extends State<StatefulCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CheckboxListTile(
        title: Text(
          widget.title,
          style: TextStyle(
              fontSize: getProportionateScreenWidth(16),
              fontWeight: FontWeight.bold),
        ),
        value: widget.value,
        onChanged: widget.onChanged,
      ),
    );
  }
}
