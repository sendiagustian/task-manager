import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:taskmanager/common/Widgets/app_widget.dart';

class WrapperProvider with ChangeNotifier {
  DateTime? currentBackPressTime;

  WrapperProvider() {
    controller = PersistentTabController(initialIndex: 0);
  }

  late PersistentTabController _controller;
  PersistentTabController get controller => _controller;
  set controller(PersistentTabController newValue) {
    _controller = newValue;
    notifyListeners();
  }

  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();

    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 3)) {
      currentBackPressTime = now;
      AppWidget.showSnackBar(
        context: context,
        content: const Text('Tekan sekali lagi untuk keluar.'),
        duration: const Duration(seconds: 2),
      );
      return Future.value(false);
    }
    return Future.value(true);
  }
}
