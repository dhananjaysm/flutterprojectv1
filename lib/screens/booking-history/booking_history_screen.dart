import 'package:flutter/material.dart';
import 'package:mileazofltr/screens/booking-history/components/body.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({super.key});
  static String routeName = '/booking_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Body(),
    );
  }
}
