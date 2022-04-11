import 'package:flutter/material.dart';
import 'package:ui__01/appbar.dart';
import 'package:ui__01/sidebar.dart';
import 'bottamnavigation.dart';
import 'dummydata.dart';
import 'sizedata.dart';

class SingleServices extends StatefulWidget {
  @override
  _SingleServicesState createState() => _SingleServicesState();
}

class _SingleServicesState extends State<SingleServices> {
  int _selectedIndex = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

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
        drawer: Sidebar(selectedIndex: 3),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: List.generate(5, (index) {
                      var item1 = Data.singleServices[index];
                      return Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 73, right: 17),
                              width: sizedata.width! * .70,
                              height: sizedata.bodyheight! * .15,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    color: AppColor.greyColor,
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 100, bottom: 3),
                                        child: Text(
                                          item1["title"],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        margin:
                                        EdgeInsets.only(right: 5, left: 100),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange),
                                      ),
                                      Expanded(
                                        child: Text(
                                          item1["subTitle1"],overflow: TextOverflow.ellipsis,
                                          softWrap: true,
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        margin:
                                        EdgeInsets.only(right: 5, left: 100),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange),
                                      ),
                                      Expanded(
                                        child: Text(
                                          item1["subTitle2"],overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        margin:
                                        EdgeInsets.only(right: 5, left: 100),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.orange),
                                      ),
                                      Expanded(
                                        child: Text(
                                          item1["subTitle3"],
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              left: 0,
                              top: 0,
                              bottom: 0,
                              child: Container(
                                width: sizedata.width! * .42,
                                child: Image(
                                  image: AssetImage(
                                      item1["photo"]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  )
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }
}