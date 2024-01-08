
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/features/main/bottom%20bar.dart';

import '../home/view/home_screen.dart';

enum BottomNavItems {
  home,
  cart,
  notifications,
  profile,
}

extension BottomNavItemsExtension on BottomNavItems {
  IconData get icon {
    switch (this) {
      case BottomNavItems.home:
        return Icons.home_outlined;
      case BottomNavItems.cart:
        return Icons.shopping_cart;
      case BottomNavItems.notifications:
        return Icons.notifications;
      case BottomNavItems.profile:
        return Icons.person;
    }
  }

  String get title {
    switch (this) {
      case BottomNavItems.home:
        return 'Home';
      case BottomNavItems.cart:
        return 'Cart';
      case BottomNavItems.notifications:
        return 'Notifications';
      case BottomNavItems.profile:
        return 'Profile';
    }
  }

  Widget get widget {
    switch (this) {
      case BottomNavItems.home:
        return HomeScreen();
      case BottomNavItems.cart:
        return CartPage();
      case BottomNavItems.notifications:
        return NotificationsPage();
      case BottomNavItems.profile:
        return ProfilePage();
    }
  }
}