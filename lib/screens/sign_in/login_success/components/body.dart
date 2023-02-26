import 'package:flutter/material.dart';
import 'package:mileazofltr/utils/components/buttons/default_button.dart';
import 'package:mileazofltr/utils/app_layout.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.04,
        ),
        // Image.asset(
        //   "assets/images/success.png",
        //   height: SizeConfig.screenHeight * 0.4, //40%
        // ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.08,
        ),
        Text("Welcome to MileaZo",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(30),
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        Spacer(),
        SizedBox(
            width: SizeConfig.screenWidth * 0.6,
            child: DefaultButton(
                text: "Back to Home",
                onPressed: () {
                  // Navigator.pushNamed(context, HomeScreen.routeName);
                })),
        Spacer()
      ],
    );
  }
}
