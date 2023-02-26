import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mileazofltr/utils/app_layout.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(Duration(seconds: 3), () {
  //     GoRouter.of(context).go('/services');
  //   });
  // }
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    // _animation = Tween(begin: 1.0, end: 2.0).animate(_controller);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceIn);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        GoRouter.of(context).go('/services');
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    print(_animation.value);
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/images/splash-logo.png',
        height: getProportionateScreenHeight(265),
        width: getProportionateScreenWidth(235),
      )),
    );
  }
}
