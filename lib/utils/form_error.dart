import 'package:flutter/material.dart';
import 'package:mileazofltr/utils/app_layout.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
      errors.length,
      (index) => formErrorText(error: errors[index]),
    ));
  }

  Row formErrorText({String? error}) {
    return Row(
      children: [
        Icon(Icons.error),
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(error!)
      ],
    );
  }
}
