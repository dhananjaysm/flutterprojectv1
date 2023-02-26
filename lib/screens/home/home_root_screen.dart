import 'package:flutter/services.dart';
import 'package:mileazofltr/screens/home/bottom_navigation_widget.dart';
import 'package:mileazofltr/utils/app_layout.dart';
import 'package:mileazofltr/utils/app_style.dart';
import 'package:flutter/material.dart';

class HomeRootScreen extends StatefulWidget {
  final Widget child;
  const HomeRootScreen({required this.child, super.key});

  @override
  State<HomeRootScreen> createState() => _HomeRootScreenState();
}

class _HomeRootScreenState extends State<HomeRootScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: getProportionateScreenWidth(12)),
        child: widget.child,
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
