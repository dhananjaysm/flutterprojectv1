import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mileazofltr/utils/app_layout.dart';
import 'package:mileazofltr/utils/app_style.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // leading: Row(
          //   children: [
          //     IconButton(
          //       icon: Icon(
          //         Icons.arrow_back,
          //         size: getProportionateScreenWidth(24),
          //       ),
          //       onPressed: () => Navigator.pop(context),
          //     ),
          //     SizedBox(width: 8),
          //     Text(
          //       'Title',
          //       style: TextStyle(fontSize: getProportionateScreenWidth(14)),
          //     ),
          //   ],
          // ),
          title: const Text(
            "Enter your area pincode",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.white,

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          )),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SearchInputLocation(),
          ],
        )
      ]),
    );
  }
}

class SearchInputLocation extends StatefulWidget {
  // final TextEditingController controller;

  const SearchInputLocation({super.key});

  @override
  State<SearchInputLocation> createState() => _SearchInputLocationState();
}

class _SearchInputLocationState extends State<SearchInputLocation> {
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
      width: SizeConfig.screenWidth * 0.9,
      child: Container(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(8)),
        decoration: BoxDecoration(
            color: Colors.grey.shade50,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8)),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: getProportionateScreenWidth(16)),
                  decoration: InputDecoration(
                    hintText: "Eg. 302017",

                    // labelText: "Phone",
                    // floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: InputBorder.none,
                    // suffixIcon: Icon(Icons.mic),
                    // prefixIcon: Icon(Icons.search),
                    prefixIcon: Icon(
                      Icons.search,
                      color:
                          focusNode.hasFocus ? kPrimaryColor : Colors.grey[400],
                    ),
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
