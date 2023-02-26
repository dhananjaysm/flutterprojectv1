import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider =
    StateNotifierProvider<HomeController, int>((ref) {
  return HomeController(0);
});

class HomeController extends StateNotifier<int> {
  HomeController(super.state);
  void setSelectedIndex(int value) {
    state = value;
  }
}
