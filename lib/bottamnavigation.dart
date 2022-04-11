import 'package:flutter/material.dart';
import 'sizedata.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: true,

      // fixedColor: AppColor.primaryColor,
      // selectedLabelStyle: TextStyle(color: Colors.purple),
      unselectedLabelStyle: TextStyle(color: Colors.purple),
      onTap: (val) {
        setState(() {
          _selectedIndex = val;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Container(
            width: sizedata.width! / 10,
            child: Image(
              image: AssetImage("Assets/homepage/home.png"),
              color: _selectedIndex == 0
                  ? AppColor.primaryColor
                  : AppColor.greyColor,
            ),
          ),
          label: "home",
        ),
        BottomNavigationBarItem(
            icon: Container(
              width: sizedata.width! / 10,
              child: Image(
                image: AssetImage(
                  "Assets/homepage/list.png",
                ),
                color: _selectedIndex == 1
                    ? AppColor.primaryColor
                    : AppColor.greyColor,
              ),
            ),
            label: "Categories"),
        BottomNavigationBarItem(
          icon: Container(
            width: sizedata.width! / 10,
            child: Image(
              image: AssetImage("Assets/homepage/gift.png"),
              color: _selectedIndex == 2
                  ? AppColor.primaryColor
                  : AppColor.greyColor,
            ),
          ),
          label: "home",
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: sizedata.width! / 10,
            child: Image(
              image: AssetImage(
                "Assets/homepage/account (1).png",
              ),
              color: _selectedIndex == 3
                  ? AppColor.primaryColor
                  : AppColor.greyColor,
            ),
          ),
          label: "home",
        ),
      ],
      currentIndex: _selectedIndex,
    );
  }
}