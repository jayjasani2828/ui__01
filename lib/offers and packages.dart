import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui__01/appbar.dart';
import 'package:ui__01/dummydata.dart';
import 'package:ui__01/sidebar.dart';
import 'Model/offersAndPackegesModel.dart';
import 'bottamnavigation.dart';
import 'sizedata.dart';
import 'package:http/http.dart' as http;

class Offers_and_Packages extends StatefulWidget {
  @override
  _Offers_and_PackagesState createState() => _Offers_and_PackagesState();
}

class _Offers_and_PackagesState extends State<Offers_and_Packages> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  int _selectedPage1 = 0;

  // List<OffersAndPackegesModel> offersList = [];
  // offersAndPackeges? data;
  //
  // getrequest() async {
  //   var url = Uri.parse('http://merbed.org/farah/public/api/offers');
  //   var response = await http.post(url);
  //   var responseData = jsonDecode(response.body);
  //   if (responseData["success"] == 200) {
  //     data = offersAndPackeges.fromJson(responseData["data"]["Package"]);
  //     // responseData["data"]["Package"].forEach((e) {
  //     //   offersList.add(offersAndPackeges.fromJson(e));
  //     // });
  //   } else {
  //     Fluttertoast.showToast(msg: responseData["message"]);
  //   }
  // }

  OffersAndPackegesModel? offersData;

  gerrequest() async {
    var url = Uri.parse("http://merbed.org/farah/public/api/offers");
    var response = await http.post(url, body: {"category_id": "5"});
    var responceData = jsonDecode(response.body);
    if (responceData["success"] == 200) {
      offersData = OffersAndPackegesModel.fromJson(responceData["data"]);
      setState(() {});
    } else {
      Fluttertoast.showToast(msg: responceData["message"]);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gerrequest();
  }

  @override
  Widget build(BuildContext context) {
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
        drawer: Sidebar(selectedIndex: 2),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (pageNumber, res) {
                      print(pageNumber);
                      setState(() {
                        _selectedPage1 = pageNumber;
                      });
                    }),
                items: [1, 2, 3, 4, 5].map((i) {
                  return StackData2();
                }).toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate([1, 2, 3, 4, 5].length, (index) {
                    return Container(
                      margin: EdgeInsets.all(2),
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _selectedPage1 == index
                              ? Colors.purple
                              : Colors.grey),
                    );
                  })
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       top: 20, left: 17, right: 17, bottom: 15),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text("Our Offers"),
              //       Text("view all"),
              //     ],
              //   ),
              // ),flu
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: List.generate(offersData?.offer?[0].productImage?.length ?? 0, (index) {
              //       var item = offersData?.offer?[index];
              //       return Container(
              //         child: Padding(
              //           padding: const EdgeInsets.only(left: 10),
              //           child: Column(
              //             children: [
              //               Container(
              //                 width: sizedata.width! * .55,
              //                 child: Image(image: AssetImage(item?.productImage?[index].image ?? "")),
              //               ),
              //               Container(
              //                 width: sizedata.width! * .55,
              //                 height: 40,
              //                 decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.only(
              //                     bottomLeft: Radius.circular(5),
              //                     bottomRight: Radius.circular(5),
              //                   ),
              //                 ),
              //                 child: Padding(
              //                   padding:
              //                   const EdgeInsets.only(left: 10, right: 10),
              //                   child: Row(
              //                     mainAxisAlignment:
              //                     MainAxisAlignment.spaceBetween,
              //                     children: [
              //                       Flexible(
              //                         child: Column(
              //                             mainAxisAlignment:
              //                             MainAxisAlignment.center,
              //                             crossAxisAlignment:
              //                             CrossAxisAlignment.start,
              //                             children: [
              //                               Text(
              //                                 item?.productName ?? "",
              //                                 overflow: TextOverflow.ellipsis,
              //                                 style: TextStyle(fontSize: 13),
              //                               ),
              //                               Text(
              //                                 item?.productNameAr ?? "",
              //                                 overflow: TextOverflow.ellipsis,
              //                                 style: TextStyle(fontSize: 13),
              //                               ),
              //                             ]),
              //                       ),
              //                       Text(
              //                         item?.rate.toString() ?? "",
              //                         style: TextStyle(
              //                           color: AppColor.primaryColor,
              //                           // overflow: TextOverflow.clip,
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       );
              //     }),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15, left: 17, right: 17, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Our Offers"),
                    Text("view all"),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      offersData?.offer?[0].productImage?.length ?? 0, (index) {
                    // var item2 = Data.offersLst1[index];
                    var item1 = offersData?.offer?[0].productImage?[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 06, top: 5),
                      child: Card(
                        elevation: 1,
                        child: Container(
                          width: sizedata.width! * .40,
                          // alignment: Alignment.center,
                          // height: sizedata.height! * .25,
                          child: Column(
                            children: [
                              Container(
                                height: 170,
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    Image.network(
                                        item1?.image ?? "",
                                        fit: BoxFit.fill),
                                    Positioned(
                                      left: 0,
                                      right: 0,
                                      bottom: 0,
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        color: AppColor.primaryColor,
                                        // height: 20,
                                        child: Text(
                                          offersData?.offer?[0].productName ??
                                              "",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: sizedata.width! * .40,
                                height: 35,
                                margin: EdgeInsets.all(5),
                                // color: Colors.purple,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            offersData?.offer?[0].productName ?? "",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                          Text(
                                            offersData?.offer?[0].productName ?? "",
                                            style: TextStyle(fontSize: 10),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Text(
                                        offersData?.offer?[0].rate.toString() ?? "",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: AppColor.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }
}

Widget StackData2() {
  return Stack(
    children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(left: 17, right: 17, top: 17, bottom: 20),
        child: Image(
          image: AssetImage(
              "Assets/Offers and Packages/denise-jans-pGZTvB2mF4s-unsplash.png"),
        ),
      ),
      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          height: sizedata.bodyheight! * .07,
          margin: EdgeInsets.only(left: 40, right: 40),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 0),
                blurRadius: 2.0,
                spreadRadius: 0.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(0, 0),
              )
            ],
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 6, left: 13),
                    child: Text(
                      "Hall special offers",
                      style: TextStyle(
                        color: Color(0xff707070),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 13),
                    child: Text(
                      "\$ 58,000",
                    ),
                  ),
                ],
              ),
              Container(
                width: sizedata.width! * .25,
                height: sizedata.bodyheight! * .05,
                margin: EdgeInsets.only(right: 17),
                decoration: BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.circular(5)),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Buy now",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}