import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:ui__01/appbar.dart';
import 'package:ui__01/sidebar.dart';
import 'package:ui__01/sizedata.dart';

import 'bottamnavigation.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _selectedIndex = 0;
  bool _switchValue = true;
  bool _switchValue1 = true;
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    sizedata(context);
    return Scaffold(
      key: _key,
      appBar:AppBar(
        // key: _key,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Container(
          width: sizedata.width! / 5,
          child: Image(
            image: AssetImage("Assets/homepage/Group 1.png"),
          ),
        ),
        actions: [
          Container(
            width: 24,
            child: Image(
              image: AssetImage("Assets/homepage/search.png"),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 17),
            width: 24,
            child: Image(
              image: AssetImage("Assets/homepage/shopping-bag.png"),
            ),
          ),
        ],
        leading: IconButton(
          icon: Image(
            image: AssetImage("Assets/homepage/Path 120.png"),
            width: 22,
          ),
          onPressed: () {
            _key.currentState!.openDrawer();
          },
        ),
      ),
      drawer: Sidebar(
        selectedIndex: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 17, top: 17, right: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Settings"),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: sizedata.width! * .20,
                  child: Image.asset(
                      "Assets/settings/tristan-dixon-VNUxLpMVA1g-unsplash.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Eduardo Dutra"),
                      Text(
                        "UAE",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        width: sizedata.width! * .10,
                        child: Image.asset("Assets/settings/flag.png"),
                      ),
                      Text(
                        "Language",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Container(
                    width: sizedata.width! * .27,
                    height: sizedata.width! * .10,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(13)),
                    child: Text(
                      "Change",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Region",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "UAE",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Location",
                    style: TextStyle(fontSize: 16),
                  ),
                  FlutterSwitch(
                    height: sizedata.width! * .07,
                    width: sizedata.width! * .14,
                    padding: 2.0,
                    toggleSize: 30.0,
                    borderRadius: 20.0,
                    activeColor: AppColor.primaryColor,
                    value: _switchValue,
                    onToggle: (value) {
                      setState(() {
                        _switchValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notification",
                    style: TextStyle(fontSize: 16),
                  ),
                  FlutterSwitch(
                    height: sizedata.width! * .07,
                    width: sizedata.width! * .14,
                    padding: 2.0,
                    toggleSize: 30.0,
                    borderRadius: 20.0,
                    activeColor: AppColor.primaryColor,
                    value: _switchValue1,
                    onToggle: (value) {
                      setState(() {
                        _switchValue1 = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Term of Service",
                  style: TextStyle(fontSize: 16),
                )),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "Feedback",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Text(
                "About Us",
                style: TextStyle(fontSize: 16),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation()
    );
  }
}
