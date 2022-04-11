import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui__01/appbar.dart';
import 'package:ui__01/dummydata.dart';
import 'package:ui__01/sidebar.dart';
import 'bottamnavigation.dart';
import 'sizedata.dart';

class Dresses extends StatefulWidget {
  @override
  _DressesState createState() => _DressesState();
}

class _DressesState extends State<Dresses> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    sizedata(context);
    return Scaffold(
      key: _key,
      appBar: AppBar(
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
      drawer: Sidebar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 17),
              child: Text(
                "List of Dresses",
                style: TextStyle(fontSize: sizedata.width! * .050),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 22, right: 5),
                      height: sizedata.bodyheight! * .060,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 20),
                            width: sizedata.width! * .08,
                            child: SvgPicture.asset("Assets/Dresses/01.svg"),
                          ),
                          Text(
                            "Short",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: sizedata.bodyheight! * .060,
                      margin: EdgeInsets.only(left: 5, right: 22),
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Filter",
                              style: TextStyle(fontSize: 18),
                            ),
                            Container(
                              width: sizedata.width! * .065,
                              height: sizedata.width! * .065,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "2",
                                style: TextStyle(color: AppColor.greyColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: List.generate(4, (index) {
                var dressesCount = Data.Dresses[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 17,top: 5,bottom: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: sizedata.width! * .35,
                        child: Image.asset(
                            dressesCount["photo"]),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding:  EdgeInsets.only(top: 10,left: 15,right: 17),
                              child: Text(
                                "Lorem Ipsum is simply dummy textof the printing ",
                                style: TextStyle(fontSize: 16,color: AppColor.greyColor),
                                overflow: TextOverflow.visible,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 17,top: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "3.4",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.amber),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                  Icon(
                                    Icons.star_border,
                                    color: Colors.amber,
                                    size: 20,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 50,left: 15,right: 17),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    dressesCount["amt"],
                                    style: TextStyle(fontSize: 24,color: AppColor.greyColor),
                                  ),
                                  Icon(Icons.shopping_bag_outlined,size: 30,color: AppColor.greyColor,),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation()
    );
  }
}