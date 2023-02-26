import 'package:flutter/material.dart';
import 'package:mileazofltr/utils/app_layout.dart';
import 'package:mileazofltr/utils/app_style.dart';

class AddVehicleScreen extends StatefulWidget {
  const AddVehicleScreen({super.key});

  @override
  State<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends State<AddVehicleScreen> {
  List<String> _locations = ['A', 'B', 'C', 'D']; // Option 2
  String _selectedLocation = 'A'; // Option 2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vehicle Details",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
          child: Column(children: [
            SizedBox(
              height: getProportionateScreenHeight(10),
            ),
            VehicleInput(
              placeholder: "Vehicle no.",
            ),
            VehicleInput(
              placeholder: "Company",
            ),
            VehicleInput(
              placeholder: "Model",
            ),
            Divider(
              height: 20,
              thickness: 1.5,
              indent: 20,
              endIndent: 20,
              color: Colors.grey.shade200,
            ),
            Column(
              children: [
                VehicleInput(placeholder: "Current KM"),
                VehicleInput(placeholder: "Last Service KM")
              ],
            )
            // DropdownButton(
            //   hint: Text(
            //       'Please choose a location'), // Not necessary for Option 1
            //   value: _selectedLocation,
            //   onChanged: (newValue) {
            //     setState(() {
            //       _selectedLocation = newValue!;
            //     });
            //   },
            //   items: _locations.map((location) {
            //     return DropdownMenuItem(
            //       child: new Text(location),
            //       value: location,
            //     );
            //   }).toList(),
            // )
          ]),
        ),
      )),
    );
  }
}

class VehicleInput extends StatefulWidget {
  // final TextEditingController controller;
  final String placeholder;
  const VehicleInput({super.key, required this.placeholder});

  @override
  State<VehicleInput> createState() => _VehicleInputState();
}

class _VehicleInputState extends State<VehicleInput> {
  final focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  // const SearchInput({Key key, this.controller}) : controller = controller ?? TextEditingController(), super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(2)),
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(8)),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  textCapitalization: TextCapitalization.characters,
                  autofocus: true,
                  focusNode: focusNode,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                  decoration: InputDecoration(
                    hintText: widget.placeholder,

                    // labelText: "Phone",
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    // suffixIcon: Icon(Icons.mic),
                    // prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
