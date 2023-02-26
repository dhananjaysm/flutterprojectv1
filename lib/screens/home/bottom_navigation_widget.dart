import 'package:mileazofltr/screens/home/controller/home_controller.dart';
import 'package:mileazofltr/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  ConsumerState<BottomNavigationWidget> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState
    extends ConsumerState<BottomNavigationWidget> {
  @override
  Widget build(BuildContext context) {
    // ref can only be used inside the build
    final selectedIndex = ref.watch(
        homeControllerProvider); //select((value) => value. for more complex states
    // final _selectedIndex = 0;
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: kPrimaryColor,
      onTap: _onItemTapped,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Services',
          // backgroundColor: Colors.red,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Bookings',
          // backgroundColor: Colors.green,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.car_repair),
          label: 'Vehicles',
          // backgroundColor: Colors.purple,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notification',
          // backgroundColor: Colors.pink,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
          // backgroundColor: Colors.pink,
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    ref.read(homeControllerProvider.notifier).setSelectedIndex(index);
    switch (index) {
      case 1:
        context.go('/bookingHistory');
        break;
      case 2:
        context.go('/vehicles');
        break;
      case 3:
        context.go('/notification');
        break;
      case 4:
        context.go('/settings');
        break;
      case 0:
      default:
        context.go('/services');
        break;
    }
  }
}
