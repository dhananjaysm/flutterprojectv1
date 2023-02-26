import 'package:flutter/material.dart';
import 'package:mileazofltr/utils/app_layout.dart';
import 'package:mileazofltr/utils/app_style.dart';
import 'package:go_router/go_router.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> vehicles = [VehicleCard(), VehicleCard(), VehicleCard()];
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(children: [
          ListView.builder(
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              return vehicles[index];
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FloatingActionButton(
                backgroundColor: kPrimaryColor,
                onPressed: () {
                  // Do something when the button is pressed
                  GoRouter.of(context).push('/vehicles/addVehicle');
                },
                child: Icon(Icons.add),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context).push('/services/vehicleDetails/100');
        // Your button press logic
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: Colors.grey.shade200,
            width: 1.0,
          ),
        ),
        elevation: 0,
        child: SizedBox(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(12),
                    vertical: getProportionateScreenHeight(12)),
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
                            fontSize: getProportionateScreenWidth(20)),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                      child: Text(
                        "RJ14CV74XX",
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(14)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // margin: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                          child: Text(
                            "Last Service:",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(12)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          // decoration: BoxDecoration(
                          //     color: Colors.lightGreen.shade50,
                          //     borderRadius: BorderRadius.circular(25)),
                          child: Text(
                            "20-Jan-2023",
                            style: TextStyle(
                                color: Colors.lightGreen,
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(12)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(8.0),
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8))),
                  // color: Colors.grey,
                  child: Image.asset('assets/images/car3.png'))
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceButtons extends StatelessWidget {
  const ServiceButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            // width: double.infinity,
            height: getProportionateScreenHeight(56),
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
                GoRouter.of(context).push('/bookService');
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Book Service",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            // width: double.infinity,
            height: getProportionateScreenHeight(56),
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
                GoRouter.of(context).push('/vehicleDetail/100');
              },
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  "Check Status",
                  style: TextStyle(
                      fontSize: getProportionateScreenWidth(18),
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
