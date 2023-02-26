import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mileazofltr/screens/otp/components/body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  static String routeName = '/otp_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OTP Verification"),
        ),
        body: Body());
  }
}
