import 'package:amazon_app/view/user/cart/cart_screen.dart';
import 'package:amazon_app/view/user/home/home_screen.dart';
import 'package:amazon_app/view/user/menu/menu_screen.dart';
import 'package:amazon_app/view/user/profile/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../utils/colors.dart';

class UserBottomNavBar extends StatefulWidget {
  const UserBottomNavBar({super.key});

  @override
  State<UserBottomNavBar> createState() => _UserBottomNavBarState();
}

class _UserBottomNavBarState extends State<UserBottomNavBar> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<PersistentTabConfig> _navBarsItems() {
    return [
      PersistentTabConfig(
        screen: const HomeScreen(),
        item: ItemConfig(
          title: "Home",
          icon: const Icon(CupertinoIcons.home),
          activeForegroundColor: teal,
          inactiveForegroundColor: black,
        ),
      ),
      PersistentTabConfig(
        screen: const ProfileScreen(),
        item: ItemConfig(
          title: "You",
          icon: const Icon(CupertinoIcons.person),
          activeForegroundColor: teal,
          inactiveForegroundColor: black,
        ),
      ),
      PersistentTabConfig(
        screen: const CartScreen(),
        item: ItemConfig(
          title: "Cart",
          icon: const Icon(CupertinoIcons.cart),
          activeForegroundColor: teal,
          inactiveForegroundColor: black,
          //selectedAnimationDuration: const Duration(milliseconds: 200),
        ),
      ),
      PersistentTabConfig(
        screen: const MenuScreen(),
        item: ItemConfig(
          title: "Menu",
          icon: const Icon(Icons.menu),
          activeForegroundColor: teal,
          inactiveForegroundColor: black,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      tabs: _navBarsItems(),
      controller: controller,
      navBarBuilder: (navBarConfig) => Style3BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0), color: Colors.white),
      ),
      //  confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      screenTransitionAnimation: const ScreenTransitionAnimation.none(
          //     curve: Curves.ease,
          //     duration: Duration(milliseconds: 200),
          ),
    );
  }
}
