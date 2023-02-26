import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mileazofltr/logic/cubits/post_cubit/post_cubit.dart';
import 'package:mileazofltr/logic/cubits/post_cubit/post_state.dart';
import 'package:mileazofltr/utils/app_layout.dart';
import 'package:mileazofltr/utils/app_style.dart';

class VehicleDetailScreen extends StatefulWidget {
  final int vehicleId;
  const VehicleDetailScreen({required this.vehicleId, super.key});

  @override
  State<VehicleDetailScreen> createState() => _VehicleDetailScreenState();
}

class _VehicleDetailScreenState extends State<VehicleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<PostCubit, PostState>(
          builder: (context, state) {
            if (state is PostLoadingState) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PostLoadedState) {
              log("here");
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.posts[index].title.toString()),
                  );
                },
              );
            }
            return Center(
              child: Text("An error occured"),
            );
          },
        ));
  }
}

class VehicleDetailCard extends StatelessWidget {
  const VehicleDetailCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                        child: Text(
                          "RJ14CV74XX",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: getProportionateScreenWidth(20)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 1,
                color: Colors.grey[300],
                margin: EdgeInsets.symmetric(vertical: 4),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: Text(
                                "Booked Date",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(14)),
                              ),
                            ),
                            Text(
                              "06-Feb-2024",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14)),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                              child: Text(
                                "Time Slot",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: getProportionateScreenWidth(14)),
                              ),
                            ),
                            Text(
                              "02:00 - 04:00pm",
                              style: TextStyle(
                                  fontSize: getProportionateScreenWidth(14)),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Expanded(
                    //   child: Container(
                    //     width: 1,
                    //     // height: double.infinity,
                    //     decoration: BoxDecoration(
                    //       border: Border(
                    //         right: BorderSide(
                    //           width: 1,
                    //           color: Colors.grey,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                          child: Text(
                            "Booking id",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: getProportionateScreenWidth(14)),
                          ),
                        ),
                        Text(
                          "#1234",
                          style: TextStyle(
                              fontSize: getProportionateScreenWidth(14)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
