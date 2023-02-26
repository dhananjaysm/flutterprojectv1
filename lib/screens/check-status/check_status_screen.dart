import 'package:flutter/material.dart';

class StatusDetailScreen extends StatefulWidget {
  final int vehicleId;
  const StatusDetailScreen({required this.vehicleId, super.key});

  @override
  State<StatusDetailScreen> createState() => _StatusDetailScreenState();
}

class _StatusDetailScreenState extends State<StatusDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text('Vehicle Details : ${widget.vehicleId}')],
      )),
    );
  }
}
