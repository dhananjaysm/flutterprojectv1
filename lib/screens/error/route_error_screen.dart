import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RouteErrorScreen extends StatefulWidget {
  final String errorMsg;
  const RouteErrorScreen({required this.errorMsg, super.key});

  @override
  State<RouteErrorScreen> createState() => _RouteErrorScreenState();
}

class _RouteErrorScreenState extends State<RouteErrorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(widget.errorMsg),
            ],
          ),
        ),
      ),
    );
  }
}
