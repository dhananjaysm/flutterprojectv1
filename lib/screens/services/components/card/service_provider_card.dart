import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mileazofltr/screens/services/components/widgets/available_slot_widget.dart';
import 'package:mileazofltr/utils/app_layout.dart';
import 'package:mileazofltr/utils/app_style.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

// import 'package:url_launcher/url_launcher.dart';
class ServiceProviderCard extends StatefulWidget {
  const ServiceProviderCard({super.key});

  @override
  State<ServiceProviderCard> createState() => _ServiceProviderCardState();
}

class _ServiceProviderCardState extends State<ServiceProviderCard> {
  List<Map<String, dynamic>> letters = [
    {'letter': 'S', 'status': false},
    {'letter': 'M', 'status': true},
    {'letter': 'T', 'status': true},
    {'letter': 'W', 'status': true},
    {'letter': 'T', 'status': true},
    {'letter': 'F', 'status': true},
    {'letter': 'S', 'status': true},
  ];
  List<Map<String, dynamic>> slots = [
    {'slot': '09:00 - 11:00 am', 'status': true},
    {'slot': '11:00 - 1:00 pm', 'status': true},
    {'slot': '2:00 - 4:00 pm', 'status': false},
    {'slot': '4:00 - 6:00 pm', 'status': true},
  ];
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '';

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text("Alert Dialog Title"),
          content: Text("Call +91989898XXX"),
          actions: [
            ElevatedButton(
              child: Text("Call"),
              onPressed: () {
                // Navigator.of(context).pop();
                _makePhoneCall('9999');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(
          color: Colors.grey.shade200,
          width: 1.0,
        ),
      ),
      elevation: 0,
      child: Column(
        children: [
          SizedBox(
            // height: 200, // specify the height of the SizedBox here
            width: double.infinity, // specify the width of the SizedBox here
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(12),
                  vertical: getProportionateScreenHeight(12)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.only(topLeft: Radius.circular(8)),
                            border: Border.all(
                                color: Colors.grey.shade300, width: 1.0)),
                        child: Image.network(
                            "https://st.hzcdn.com/fimgs/pictures/garages/garage-shelving-garage-solutions-savannah-img~6291443a07a0f876_3769-1-6b563d8-w360-h360-b0-p0.jpg"),
                      ),
                      const SizedBox(
                          width:
                              8), // add a horizontal space between the image and the text
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "ABC Service Center",
                            style: TextStyle(
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(14)),
                          ),
                          const SizedBox(
                              height:
                                  8), // add a vertical space between the text elements
                          const Text("Location: Jagatpura"),
                          const SizedBox(
                              height:
                                  8), // add a vertical space between the text elements
                          const Text("Phone: +919872XXXXXX"),
                          const SizedBox(height: 8),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Opening Days",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: getProportionateScreenWidth(10),
                                ),
                                Row(
                                  children: letters.map((letter) {
                                    return OpeningCircleWidget(
                                      text: letter['letter'],
                                      status: letter['status'],
                                    );
                                  }).toList(),
                                )
                              ]),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: getProportionateScreenHeight(10),
                  ),
                  Row(
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
                              _showDialog();
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.phone,
                                    size: getProportionateScreenWidth(12)),
                                // SizedBox(
                                //   width: getProportionateScreenWidth(4),
                                // ),
                                SizedBox(
                                  width: getProportionateScreenWidth(4),
                                ),
                                Text(
                                  "Call",
                                  style: TextStyle(
                                      fontSize: getProportionateScreenWidth(12),
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
                            GoRouter.of(context).push('/services/bookService');
                          },
                          child: Text(
                            "Book",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OpeningCircleWidget extends StatefulWidget {
  final String text;
  final bool status;
  const OpeningCircleWidget(
      {required this.text, required this.status, super.key});

  @override
  State<OpeningCircleWidget> createState() => _OpeningCircleWidgetState();
}

class _OpeningCircleWidgetState extends State<OpeningCircleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(
      //     horizontal: getProportionateScreenWidth(10),
      //     vertical: getProportionateScreenHeight(8)),
      margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(2)),
      decoration: BoxDecoration(
        color: widget.status ? Colors.green.shade300 : Colors.red.shade300,
        borderRadius: BorderRadius.circular(50.0),
      ),
      width: getProportionateScreenWidth(16),
      height: getProportionateScreenWidth(16),
      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(8),
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
