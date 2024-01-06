import 'package:flutter/material.dart';
import 'package:untitled/constants/colors.dart';
import 'nav_bar_items.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  BottomNavItems _bottomNavItems = BottomNavItems.home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPage(_bottomNavItems),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        currentIndex: _bottomNavItems.index,
        type: BottomNavigationBarType.fixed,
        items: BottomNavItems.values
            .map((item) => _buildBottomNavigationBarItem(item))
            .toList(),
        onTap: (index) {
          setState(() {
            _bottomNavItems = BottomNavItems.values[index];
          });
        },
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(BottomNavItems item) {
    final isSelected = _bottomNavItems == item;
    return BottomNavigationBarItem(
      icon: Container(
        padding: EdgeInsets.only(bottom: isSelected ? 4.0 : 0),
        decoration: BoxDecoration(
          boxShadow: isSelected
              ? [
            BoxShadow(
              color: Color.fromARGB(255, 228, 228, 228),
              offset: Offset(0, 2),
              blurRadius: 7,
            ),
          ]
              : [],
        ),
        child: Icon(item.icon),
      ),
      label: item.title,
    );
  }

  Widget _buildPage(BottomNavItems item) {
    return item.widget;
  }
}

////TODo////

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("no notifications available"),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("no notifications available"),
    );
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("no notifications available"),
    );
  }
}