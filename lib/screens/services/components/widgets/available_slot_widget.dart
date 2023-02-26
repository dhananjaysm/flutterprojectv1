import 'package:flutter/material.dart';
import 'package:mileazofltr/utils/app_layout.dart';

class AvailableSlots extends StatelessWidget {
  const AvailableSlots({
    super.key,
    required this.slots,
  });

  final List<Map<String, dynamic>> slots;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        "Available Slots",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Wrap(
          spacing: getProportionateScreenWidth(8), // gap between adjacent chips
          // runSpacing: getProportionateScreenWidth(
          //     2), // gap between lines
          children: slots.map((slot) {
            return AvailableSlotWidget(
              text: slot['slot'],
              status: slot['status'],
            );
          }).toList()),
    ]);
  }
}

class AvailableSlotWidget extends StatefulWidget {
  final String text;
  final bool status;
  const AvailableSlotWidget(
      {super.key, required this.text, required this.status});

  @override
  State<AvailableSlotWidget> createState() => _AvailableSlotWidgetState();
}

class _AvailableSlotWidgetState extends State<AvailableSlotWidget> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor:
          widget.status ? Colors.green.shade50 : Colors.red.shade50,
      label: Text(
        widget.text,
        style: TextStyle(
          fontSize: getProportionateScreenWidth(10),
          color: widget.status ? Colors.green.shade400 : Colors.red.shade400,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
