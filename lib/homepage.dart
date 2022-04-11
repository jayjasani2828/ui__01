import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui__01/Model/homePageModel.dart';
import 'package:ui__01/appbar.dart';
import 'package:ui__01/bottamnavigation.dart';
import 'package:ui__01/sidebar.dart';
import 'package:ui__01/sizedata.dart';
import 'package:http/http.dart' as http;

import 'Model/BannerModel.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedPage = 0;
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<ServicesData> servicesLst = [];
  List<BannerModel> bannerLst = [];


  getRequestHomePage() async {
    var url = Uri.parse("http://merbed.org/farah/public/api/service");
    var response = await http.get(url);
    setState(() {
      // isLoading = true;
    });
    var responceData = jsonDecode(response.body);

    if (responceData["success"] == 200) {
      responceData["data"].forEach((el) {
        servicesLst.add(ServicesData.fromJson(el));
      });
      setState(() {
        // isLoading = false;
      });
      print(servicesLst.length);
    } else {
      Fluttertoast.showToast(msg: responceData["message"]);
      // isLoading = false;
    }
  }

  getBannerRequest() async {
    var url = Uri.parse("http://merbed.org/farah/public/api/banner_list");
    var response = await http.get(url);
    var responceData = jsonDecode(response.body);

    if (responceData["success"] == 200) {
      responceData["data"].forEach((el) {
        bannerLst.add(BannerModel.fromJson(el));
      });

      setState(() {});
      print(bannerLst.length);
    } else {
      Fluttertoast.showToast(msg: responceData["message"]);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequestHomePage();
    getBannerRequest();
  }

  @override
  Widget build(BuildContext context) {
    sizedata(context);
    return Scaffold(
        key: _key,
        appBar: AppBar(
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
        drawer: Sidebar(selectedIndex: 0),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (pageNumber, res) {
                      print(pageNumber);
                      setState(() {
                        _selectedPage = pageNumber;
                      });
                    }),
                items: bannerLst.map((i) {
                  return stackData();
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    int.parse(bannerLst.length.toString()).toInt(),
                    (index) => Container(
                      width: 7,
                      height: 7,
                      margin: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _selectedPage == index
                            ? Colors.purple
                            : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 17, top: 22),
                    child: Text(
                      "Other services",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 250,
                margin: EdgeInsets.only(left: 17, right: 17),
                child: GridView.builder(
                  itemCount: servicesLst.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10, crossAxisCount: 3),
                  itemBuilder: (context, index) {
                    var item = servicesLst[index];
                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (index == 0) {
                              Navigator.pushNamed(
                                context,
                                "/bookingServices",
                              );
                            } else if (index == 1) {
                              Navigator.pushNamed(
                                context,
                                "/book_A_Hotel",
                              );
                            } else if (index == 2) {
                              Navigator.pushNamed(
                                context,
                                "/SalonServices",
                              );
                            } else if (index == 3) {
                              Navigator.pushNamed(
                                context,
                                "/LadiesServices",
                              );
                            } else if (index == 4) {
                              Navigator.pushNamed(
                                context,
                                "/Dresses",
                              );
                            }
                          },
                          child: Container(
                            width: sizedata.width! * .12,
                            margin: EdgeInsets.only(top: 15, bottom: 10),
                            child: Image.network(item.image ?? ""),
                          ),
                        ),
                        Text(
                          item.serviceName ?? "",
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25, left: 17, right: 17),
                child: Container(
                  width: double.infinity,
                  child: Image(
                    image: AssetImage(
                        "Assets/homepage/satria-aditya-moHSPOxxnhI-unsplash.png"),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }

  Widget stackData() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          margin: EdgeInsets.only(top: 17, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.network(
            bannerLst[_selectedPage].image ?? "",
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 54,
            margin: EdgeInsets.only(left: 45, right: 45),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 10,
                  color: Color.fromRGBO(0, 0, 8, 0.1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 20),
                          child: Text(
                            "Salon special offers",
                            style: TextStyle(color: Color(0xff707070)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 20),
                          child: Text("\$678"),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: sizedata.width! / 4.5,
                  height: sizedata.width! / 14,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Color(0xff8D5A9B),
                      borderRadius: BorderRadius.circular(5)),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Buy now",
                      style: TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
