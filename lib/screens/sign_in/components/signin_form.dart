import 'package:flutter/material.dart';
import 'package:mileazofltr/screens/otp/otp_screen.dart';
import 'package:mileazofltr/utils/components/buttons/default_button.dart';
import 'package:mileazofltr/utils/app_layout.dart';
import 'package:mileazofltr/utils/app_style.dart';
import 'package:mileazofltr/utils/form_error.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  bool remember = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        TextFormField(
          keyboardType: TextInputType.number,
          onChanged: (value) {
            if (value.isNotEmpty &&
                errors.contains("Please enter the phone number")) {
              setState(() {
                errors.remove("Please enter the phone number");
              });
            } else if (value.length == 10 &&
                errors.contains("Please enter 10 digit phone no.")) {
              errors.remove("Please enter 10 digit phone no.");
            }
          },
          validator: (value) {
            if (value!.isEmpty &&
                !errors.contains("Please enter the phone number")) {
              setState(() {
                errors.add("Please enter the phone number");
              });
              return "";
            } else if (value.length != 10 &&
                !errors.contains("Please enter 10 digit phone no.")) {
              errors.add("Please enter 10 digit phone no.");
              return "";
            }
            return null;
            // return null;
          },
          style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          decoration: InputDecoration(
              hintText: "Enter your phone no.",
              labelText: "Phone",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.phone_android)),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        TextFormField(
          keyboardType: TextInputType.visiblePassword,
          onChanged: (value) {},
          validator: (value) {
            if (value!.isEmpty &&
                !errors.contains("Please enter the phone number")) {
              setState(() {
                errors.add("Please enter the phone number");
              });
              return "";
            } else if (value.length != 10 &&
                !errors.contains("Please enter 10 digit phone no.")) {
              errors.add("Please enter 10 digit phone no.");
              return "";
            }
            return null;
            // return null;
          },
          style: TextStyle(fontSize: getProportionateScreenWidth(18)),
          decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Icon(Icons.lock)),
        ),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        Row(
          children: [
            Checkbox(
              value: remember,
              activeColor: kPrimaryColor,
              onChanged: (value) {
                setState(() {
                  remember = value!;
                });
              },
            ),
            Text("Remember me"),
            Spacer(),
            Text(
              "Forgot password?",
              style: TextStyle(decoration: TextDecoration.underline),
            )
          ],
        ),
        FormError(errors: errors),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        DefaultButton(
          text: "Continue",
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              Navigator.pushNamed(context, OtpScreen.routeName);
            }
          },
        )
      ]),
    );
  }
}
