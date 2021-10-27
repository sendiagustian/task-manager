import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:taskmanager/screens/dashboard/dashboard.dart';
import 'package:taskmanager/screens/profile/profile.dart';
import 'package:taskmanager/screens/task_manager/task_manager.dart';
import 'package:taskmanager/screens/wrapper/providers/wrapper_provider.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  List<Widget> _buildScreens() {
    return [
      const DashboardScreen(),
      const TaskManagerScreen(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.home),
        iconSize: 20,
        title: ("Dashboard"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey[400],
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.clock),
        iconSize: 20,
        title: "Task Manager",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey[400],
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.user),
        iconSize: 20,
        title: "Profil",
        textStyle: const TextStyle(color: Colors.white),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey[400],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WrapperProvider(),
      child: Consumer<WrapperProvider>(
        builder: (_, WrapperProvider wrapperProvider, __) {
          return Scaffold(
            body: PersistentTabView(
              context,
              controller: wrapperProvider.controller,
              resizeToAvoidBottomInset: true,
              onWillPop: (_) => wrapperProvider.onWillPop(context),
              onItemSelected: (int index) {
                debugPrint(index.toString());
              },
              screens: _buildScreens(),
              items: _navBarsItems(),
              popActionScreens: PopActionScreensType.all,
              itemAnimationProperties: const ItemAnimationProperties(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
              ),
              screenTransitionAnimation: const ScreenTransitionAnimation(
                animateTabTransition: true,
                curve: Curves.ease,
                duration: Duration(milliseconds: 200),
              ),
              navBarStyle: NavBarStyle.style1,
            ),
          );
        },
      ),
    );
  }
}
