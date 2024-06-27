import 'package:amazon_app/view/seller/inventory/inventory_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../utils/colors.dart';
import '../monitor/monitor_screen.dart';

class SellerBottomNavBar extends StatefulWidget {
  const SellerBottomNavBar({super.key});

  @override
  State<SellerBottomNavBar> createState() => _SellerBottomNavBarState();
}

class _SellerBottomNavBarState extends State<SellerBottomNavBar> {
  PersistentTabController controller = PersistentTabController(initialIndex: 0);
/*
  List<Widget> _buildScreens() {
    return [const InventoryScreen(), const MonitorScreen()];
  }

*/
  List<PersistentTabConfig> _navBarsItems() {
    return [
      PersistentTabConfig(
        screen: const InventoryScreen(),
        item: ItemConfig(
          icon: const Icon(Icons.inventory_2_outlined),
          title: "Inventory",
          activeForegroundColor: teal,
          inactiveForegroundColor: black,
          // selectedAnimationDuration: const Duration(milliseconds: 200)
        ),
      ),
      PersistentTabConfig(
        screen: const MonitorScreen(),
        item: ItemConfig(
          icon: const Icon(Icons.bar_chart_outlined),
          title: "Monitor",
          activeForegroundColor: teal,
          inactiveForegroundColor: black,
          //selectedAnimationDuration: const Duration(milliseconds: 200)
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
      //screen: _buildScreens(),
      //confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
    );
  }
}
