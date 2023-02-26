import 'package:mileazofltr/utils/app_layout.dart';
import 'package:mileazofltr/utils/app_style.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
            child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BookingCard(),
          BookingCard(),
        ],
      ),
    )));
  }
}

class BookingCard extends StatelessWidget {
  const BookingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Your button press logic
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
        elevation: 0,
        child: SizedBox(
          width: double.infinity,
          // width: SizeConfig.screenWidth * 0.8,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Text(
                              "Wagon R",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  fontSize: getProportionateScreenWidth(16)),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text(
                              "RJ14CV74XX",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(12)),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text(
                              "ABC Service Centre",
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(12)),
                            ),
                          ),
                          Text(
                            "Location: Jagatpura",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Text(
                              "Status",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(12)),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                                color: Colors.lightGreen.shade50,
                                borderRadius: BorderRadius.circular(25)),
                            child: Text(
                              "Completed",
                              style: TextStyle(
                                  color: Colors.lightGreen,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(10)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 1,
                  color: Colors.grey[300],
                  // margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text(
                              "Booked Date",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(12)),
                            ),
                          ),
                          Text(
                            "06-Feb-2024",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text(
                              "Time Slot",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(12)),
                            ),
                          ),
                          Text(
                            "02:00 - 04:00pm",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12)),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: Text(
                              "Booking id",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(12)),
                            ),
                          ),
                          Text(
                            "#1234",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(12)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  color: Colors.grey[300],
                  // margin: EdgeInsets.symmetric(vertical: 10),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Type",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(14)),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(10),
                      ),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(8.0),
                                horizontal: getProportionateScreenWidth(16.0)),
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade50,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Repair",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(12)),
                            ),
                          ),
                          SizedBox(
                            width: getProportionateScreenWidth(10),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: getProportionateScreenHeight(8.0),
                                horizontal: getProportionateScreenWidth(16.0)),
                            decoration: BoxDecoration(
                                color: Colors.lightBlue.shade50,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Service@8000km",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: getProportionateScreenWidth(12)),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "₹2000",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(20)),
                      ),
                      BookingHistoryButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookingHistoryButton extends StatelessWidget {
  const BookingHistoryButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          children: [
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
                onPressed: () {},
                child: Text(
                  "Invoice",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(10),
            ),
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
                onPressed: () {},
                child: Text(
                  "Details",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(12),
                      color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
