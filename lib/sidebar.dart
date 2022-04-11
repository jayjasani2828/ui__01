import 'package:flutter/material.dart';
import 'package:ui__01/sizedata.dart';

class Sidebar extends StatefulWidget {
  final int selectedIndex;

  Sidebar({this.selectedIndex = 0});

  @override
  SidebarState createState() => SidebarState();
}

class SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext index) {
    sizedata(context);
    return Drawer(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage("Assets/sidebar/Path 118.png"),
              ),
              Image(
                image: AssetImage("Assets/sidebar/Path 118 copy.png"),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50, left: 17),
                width: sizedata.width! * .20,
                height: sizedata.width! * .20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          "Assets/sidebar/griffin-wooldridge-7Sz71zuuW4k-unsplash.png"),
                      fit: BoxFit.cover),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 17, top: 5),
                child: Text(
                  "Eduardo Dutra",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(left: 17, right: 17, top: 17, bottom: 15),
                height: sizedata.height! * .001,
                width: double.infinity,
                color: Colors.grey,
              ),
              Container(
                height: sizedata.bodyheight! * .60,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/homepage");
                        },
                        leading: Container(
                          width: sizedata.width! * .07,
                          child: Image(
                            image: AssetImage("Assets/sidebar/home.png"),
                            color: widget.selectedIndex == 0
                                ? AppColor.primaryColor
                                : AppColor.greyColor,
                          ),
                        ),
                        title: Text(
                          "Home",
                          style: TextStyle(
                            color: widget.selectedIndex == 0
                                ? AppColor.primaryColor
                                : AppColor.greyColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, "/categories");
                        },
                        leading: Container(
                            width: sizedata.width! * .07,
                            child: Image(
                              image: AssetImage("Assets/sidebar/list.png"),
                              color: widget.selectedIndex == 1
                                  ? AppColor.primaryColor
                                  : AppColor.greyColor,
                            )),
                        title: Text(
                          'Categories',
                          style: TextStyle(
                            color: widget.selectedIndex == 1
                                ? AppColor.primaryColor
                                : AppColor.greyColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, "/offers_and_packages");
                        },
                        leading: Container(
                            width: sizedata.width! * .07,
                            child: Image(
                              image: AssetImage("Assets/sidebar/gift.png"),
                              color: widget.selectedIndex == 2
                                  ? AppColor.primaryColor
                                  : AppColor.greyColor,
                            )),
                        title: Text(
                          "Offers and packages",
                          style: TextStyle(
                            color: widget.selectedIndex == 2
                                ? AppColor.primaryColor
                                : AppColor.greyColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, "/singleServices");
                        },
                        leading: Container(
                            width: sizedata.width! * .07,
                            child: Image(
                              image:
                                  AssetImage("Assets/sidebar/calendar (1).png"),
                              color: widget.selectedIndex == 3
                                  ? AppColor.primaryColor
                                  : AppColor.greyColor,
                            )),
                        title: Text(
                          "Single services",
                          style: TextStyle(
                            color: widget.selectedIndex == 3
                                ? AppColor.primaryColor
                                : AppColor.greyColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/Contact_Us");
                        },
                        leading: Container(
                          width: sizedata.width! * .07,
                          child: Image(
                            image: AssetImage("Assets/sidebar/phone.png"),
                            color: widget.selectedIndex == 4
                                ? AppColor.primaryColor
                                : AppColor.greyColor,
                          ),
                        ),
                        title: Text(
                          "Contact us",
                          style: TextStyle(
                            color: widget.selectedIndex == 4
                                ? AppColor.primaryColor
                                : AppColor.greyColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/Settings");
                        },
                        leading: Container(
                          width: sizedata.width! * .07,
                          child: Image(
                            image: AssetImage("Assets/sidebar/support.png"),
                            color: widget.selectedIndex == 5
                                ? AppColor.primaryColor
                                : AppColor.greyColor,
                          ),
                        ),
                        title: Text(
                          "Settings",
                          style: TextStyle(
                            color: widget.selectedIndex == 5
                                ? AppColor.primaryColor
                                : AppColor.greyColor,
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, "/MyAccount");
                        },
                        leading: Container(
                          width: sizedata.width! * .07,
                          child: Image(
                            image: AssetImage("Assets/sidebar/account (1).png"),
                            color: widget.selectedIndex == 6
                                ? AppColor.primaryColor
                                : AppColor.greyColor,
                          ),
                        ),
                        title: Text(
                          "My account",
                          style: TextStyle(
                            color: widget.selectedIndex == 6
                                ? AppColor.primaryColor
                                : AppColor.greyColor,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Container(
                            width: sizedata.width! * .07,
                            child: Image(
                              image: AssetImage("Assets/sidebar/share (3).png"),
                            )),
                        title: Text("Share the App"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}