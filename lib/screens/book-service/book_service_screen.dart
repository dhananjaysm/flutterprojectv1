import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mileazofltr/helper/widgets/checkbox_widget.dart';
import 'package:mileazofltr/helper/widgets/datepicker_widget.dart';
import 'package:mileazofltr/utils/app_layout.dart';
import 'package:mileazofltr/utils/app_style.dart';

class BookService extends StatefulWidget {
  const BookService({super.key});

  @override
  State<BookService> createState() => _BookServiceState();
}

class _BookServiceState extends State<BookService> {
  int? groupValue = 1;
  int value = 0;
  String text = "";

  bool _repairCheckBox = false;
  bool _serviceCheckBox = false;

  DateTime _selectedDate = DateTime.now();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text("Alert Dialog Title"),
          content: Row(
            children: [],
          ),
          actions: [
            ElevatedButton(onPressed: () {}, child: Text("Confirm"))
            // OutlinedButton(
            //   style: OutlinedButton.styleFrom(
            //       // side: BorderSide(color: kPrimaryColor)
            //       backgroundColor: kPrimaryColor),
            //   onPressed: () {
            //     debugPrint('Received click');
            //   },
            //   child: const Text('Confirm'),
            // )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Book Service",
            style: appBarTitleStyle,
          ),
          actions: [],
        ),
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                height: 80.0,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Service Provider",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "ABC Service Center",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Location",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text("Jagatpura")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                // height: 80.0,
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Vehicle",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 1,
                      decoration: BoxDecoration(color: Colors.grey.shade300),
                      margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(5)),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                // height: 80.0,
                child: Column(
                  children: [
                    // customRadioButton("Wagon R", 1),

                    customRadioButton("RJ14CV74XX", "Wagon R", 1),
                    customRadioButton("RJ14CV74XX", "Maruti 800", 2),
                    // customRadioButton("RJ14CV74XX", "Wagnon R", 3),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                // height: 80.0,
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(10)),
                margin: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Type",
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(16),
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      height: 1,
                      decoration: BoxDecoration(color: Colors.grey.shade300),
                      margin: EdgeInsets.symmetric(
                          vertical: getProportionateScreenHeight(5)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        StatefulCheckbox(
                          title: "Repair",
                          value: _repairCheckBox,
                          onChanged: (value) {
                            setState(() {
                              _repairCheckBox = value;
                            });
                          },
                        ),
                        StatefulCheckbox(
                          title: "Service",
                          value: _serviceCheckBox,
                          onChanged: (value) {
                            setState(() {
                              _serviceCheckBox = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Container(
                    // height: 80.0,
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(10)),
                    margin: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(10)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Select Date",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(16),
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                            height: 1,
                            decoration:
                                BoxDecoration(color: Colors.grey.shade300),
                            margin: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(5)),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: SizeConfig.screenWidth * 0.6,
                                padding: EdgeInsets.symmetric(
                                    horizontal:
                                        getProportionateScreenWidth(10)),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey.shade300),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              getProportionateScreenWidth(16),
                                          color: Colors.black),
                                    ),
                                    StatefulDatePicker(
                                      initialDate: DateTime.now(),
                                      onDateChanged: (DateTime date) {
                                        setState(() {
                                          _selectedDate = date;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ]))),
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        // width: SizeConfig.screenWidth * 0.2,
                        height: getProportionateScreenHeight(42),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: kSecondaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          // onPressed: () {
                          // Navigator.pushNamed(context, SignInScreen.routeName);
                          // },
                          onPressed: () {
                            // _showDialog();
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.phone,
                                  size: getProportionateScreenWidth(18)),
                              // SizedBox(
                              //   width: getProportionateScreenWidth(4),
                              // ),
                              SizedBox(
                                width: getProportionateScreenWidth(4),
                              ),
                              Text(
                                "Call",
                                style: TextStyle(
                                    fontSize: getProportionateScreenWidth(18),
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      // width: SizeConfig.screenWidth * 0.2,
                      height: getProportionateScreenHeight(42),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        // onPressed: () {
                        // Navigator.pushNamed(context, SignInScreen.routeName);
                        // },
                        onPressed: () {
                          // GoRouter.of(context).push('/services/bookService');
                          _showDialog();
                        },
                        child: Text(
                          "Book",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(18),
                              color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        )));
  }

  Widget customRadioButton(String vehicleNo, String model, int index) {
    return Container(
      margin: EdgeInsets.only(bottom: getProportionateScreenWidth(4)),
      width: SizeConfig.screenWidth * 0.75,
      height: getProportionateScreenHeight(56),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            value = index;
            text = model;
          });
        },
        style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                side: BorderSide(
                    color:
                        value == index ? kPrimaryColor : Colors.grey.shade200),
                borderRadius: BorderRadius.circular(8))),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                model,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(16)),
              ),
              Text(
                vehicleNo,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(16)),
              ),
              Icon(
                value == index ? Icons.radio_button_on : Icons.radio_button_off,
                color: value == index ? kPrimaryColor : Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}
