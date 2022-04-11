import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui__01/sidebar.dart';
import 'package:ui__01/sizedata.dart';

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    sizedata(context);
    return Scaffold(
      drawer: Sidebar(selectedIndex: 6),
      key: _key,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("Assets/My Account/Path 584.png"),
              Image.asset("Assets/My Account/Path 118.png")
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  _key.currentState!.openDrawer();
                },
                child: Container(
                  width: sizedata.width! * .07,
                  margin: EdgeInsets.only(left: 17, top: 55),
                  child: Image(
                    image: AssetImage("Assets/My Account/Path 120.png"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: sizedata.width! * .35,
                      height: sizedata.width! * .35,
                      child: Image(
                        image: AssetImage("Assets/My Account/Group 648.png"),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: Text(
                  "Eduardo Dutra",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ListTile(
                leading: Container(
                  width: sizedata.width! * .08,
                  child: SvgPicture.asset("Assets/My Account/Tracking.svg"),
                ),
                title: Text(
                  "My Orders",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  width: sizedata.width! * .08,
                  child: SvgPicture.asset("Assets/My Account/shopping-bag.svg"),
                ),
                title: Text(
                  "My Cart",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  width: sizedata.width! * .08,
                  child: SvgPicture.asset("Assets/My Account/user.svg"),
                ),
                title: Text(
                  "Account Info",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  width: sizedata.width! * .08,
                  child: SvgPicture.asset("Assets/My Account/password (3).svg"),
                ),
                title: Text(
                  "Change Password",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Container(
                  width: sizedata.width! * .08,
                  child: SvgPicture.asset("Assets/My Account/support (1).svg"),
                ),
                title: Text(
                  "Help",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ListTile(
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
                leading: Container(
                  width: sizedata.width! * .08,
                  child: SvgPicture.asset("Assets/My Account/Group 644.svg"),
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
