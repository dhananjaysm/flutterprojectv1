import 'package:mileazofltr/screens/vehicles/components/body.dart';
import 'package:mileazofltr/utils/app_layout.dart';
import 'package:flutter/material.dart';

class VehiclesScreen extends StatefulWidget {
  const VehiclesScreen({super.key});

  @override
  State<VehiclesScreen> createState() => _VehiclesScreenState();
}

class _VehiclesScreenState extends State<VehiclesScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
// WillPopScope(
//       onWillPop: () async {
//         if (_selectedIndex == 0) {
//           return false;
//         } else {
//           setState(() {
//             _selectedIndex = 0;
//           });
//           return false;
//         }
//       },
//       child:
    return SafeArea(
      child: Body(),
    );
  }
}
