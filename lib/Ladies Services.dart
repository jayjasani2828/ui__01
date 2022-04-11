import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui__01/appbar.dart';
import 'package:ui__01/sidebar.dart';
import 'Model/Book_A_hotel_Model.dart';
import 'bottamnavigation.dart';
import 'ongenerate.dart';
import 'sizedata.dart';
import 'package:http/http.dart' as http;

class LadiesServices extends StatefulWidget {
  RouteArguments arg;

  LadiesServices({required this.arg});

  @override
  _LadiesServicesState createState() => _LadiesServicesState();
}

class _LadiesServicesState extends State<LadiesServices> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  int _selectedIndex = 0;

  ServiceCategoryModel? bookHModel;

  getRequest() async {
    var url = Uri.parse('http://merbed.org/farah/public/api/service_category');
    var response = await http
        .post(url, body: {"service_list_id": widget.arg.id.toString()});
    var responceData = jsonDecode(response.body);
    if (responceData["success"] == 200) {
      setState(() {});
      bookHModel = ServiceCategoryModel.fromJson(responceData["data"][0]);
    } else {
      Fluttertoast.showToast(msg: responceData["message"]);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequest();
  }

  @override
  Widget build(BuildContext context) {
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
        drawer: Sidebar(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 17, right: 10),
                  child: Row(
                    children: List.generate(bookHModel?.products?.length ?? 0, (index) {
                      var l1 = bookHModel!.products![index];
                      return Column(
                        children: [
                          Text(l1.productName ?? " "),
                          Container(
                            width: sizedata.width! * .55,
                            height: sizedata.height! * .20,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  blurStyle: BlurStyle.outer,
                                  color: Colors.grey,
                                  blurRadius: 1,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  height: sizedata.height!*.15,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      l1.productImage ?? "",
                                      width: sizedata.width! * .55,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 10, right: 10),
                                  child: Row(
                                     mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 07),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              l1.productName ?? "",
                                              style: TextStyle(
                                                  fontSize: sizedata.width! * .035),
                                            ),
                                            Container(
                                              width: sizedata.width! * .20,
                                              child: Image.asset(
                                                  "Assets/ladiesServices/Group 517.png"),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(l1.rate.toString(),style: TextStyle(color: AppColor.primaryColor,fontSize: 18),),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 17, right: 17, top: 17, bottom: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "Body care",
              //         style: TextStyle(fontSize: 18),
              //       ),
              //       Text(
              //         "View All",
              //         style:
              //             TextStyle(fontSize: 12, color: AppColor.primaryColor),
              //       ),
              //     ],
              //   ),
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10, right: 10),
              //     child: Row(
              //       children: List.generate(4, (index) {
              //         var items = Data.LadiServices2[index];
              //         return Padding(
              //           padding: const EdgeInsets.only(
              //             left: 5,
              //           ),
              //           child: Card(
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: Container(
              //               width: sizedata.width! * .40,
              //               height: sizedata.bodyheight! * .26,
              //               decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(10)),
              //               child: Column(
              //                 children: [
              //                   ClipRRect(
              //                     borderRadius: BorderRadius.only(
              //                       topLeft: Radius.circular(10),
              //                       topRight: Radius.circular(10),
              //                     ),
              //                     child: Image.asset(
              //                       items["photo"],
              //                       width: sizedata.width! * .45,
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding:
              //                         const EdgeInsets.only(left: 5, right: 5),
              //                     child: Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Column(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             SizedBox(height: 6),
              //                             Text(
              //                               "Lorem Ipsum",
              //                               style: TextStyle(
              //                                   fontSize:
              //                                       sizedata.width! * .036),
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Icon(
              //                                   Icons.star,
              //                                   color: Colors.amber,
              //                                   size: 15,
              //                                 ),
              //                                 Icon(
              //                                   Icons.star,
              //                                   color: Colors.amber,
              //                                   size: 15,
              //                                 ),
              //                                 Icon(
              //                                   Icons.star,
              //                                   color: Colors.amber,
              //                                   size: 15,
              //                                 ),
              //                                 Icon(
              //                                   Icons.star_border,
              //                                   color: AppColor.greyColor,
              //                                   size: 15,
              //                                 ),
              //                                 Icon(
              //                                   Icons.star_border,
              //                                   color: AppColor.greyColor,
              //                                   size: 15,
              //                                 ),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                         Text(
              //                           items["amt"],
              //                         ),
              //                       ],
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //         );
              //       }),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(
              //       left: 17, right: 17, top: 17, bottom: 10),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Text(
              //         "Dresses",
              //         style: TextStyle(fontSize: 18),
              //       ),
              //       Text(
              //         "View All",
              //         style:
              //             TextStyle(fontSize: 12, color: AppColor.primaryColor),
              //       ),
              //     ],
              //   ),
              // ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10, right: 10),
              //     child: Row(
              //       children: List.generate(4, (index) {
              //         var items1 = Data.LadiServices3[index];
              //         return Padding(
              //           padding: const EdgeInsets.only(
              //             left: 5,
              //           ),
              //           child: Card(
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10),
              //             ),
              //             child: Container(
              //               width: sizedata.width! * .40,
              //               height: sizedata.bodyheight! * .26,
              //               decoration: BoxDecoration(
              //                   color: Colors.white,
              //                   borderRadius: BorderRadius.circular(10)),
              //               child: Column(
              //                 children: [
              //                   ClipRRect(
              //                     borderRadius: BorderRadius.only(
              //                       topLeft: Radius.circular(10),
              //                       topRight: Radius.circular(10),
              //                     ),
              //                     child: Image.asset(
              //                       items1["photo"],
              //                       width: sizedata.width! * .45,
              //                       fit: BoxFit.cover,
              //                     ),
              //                   ),
              //                   Padding(
              //                     padding:
              //                         const EdgeInsets.only(left: 5, right: 5),
              //                     child: Row(
              //                       mainAxisAlignment:
              //                           MainAxisAlignment.spaceBetween,
              //                       children: [
              //                         Column(
              //                           mainAxisAlignment:
              //                               MainAxisAlignment.center,
              //                           crossAxisAlignment:
              //                               CrossAxisAlignment.start,
              //                           children: [
              //                             SizedBox(height: 6),
              //                             Text(
              //                               "Lorem Ipsum",
              //                               style: TextStyle(
              //                                   fontSize:
              //                                       sizedata.width! * .036),
              //                             ),
              //                             Row(
              //                               children: [
              //                                 Icon(
              //                                   Icons.star,
              //                                   color: Colors.amber,
              //                                   size: 15,
              //                                 ),
              //                                 Icon(
              //                                   Icons.star,
              //                                   color: Colors.amber,
              //                                   size: 15,
              //                                 ),
              //                                 Icon(
              //                                   Icons.star,
              //                                   color: Colors.amber,
              //                                   size: 15,
              //                                 ),
              //                                 Icon(
              //                                   Icons.star_border,
              //                                   color: AppColor.greyColor,
              //                                   size: 15,
              //                                 ),
              //                                 Icon(
              //                                   Icons.star_border,
              //                                   color: AppColor.greyColor,
              //                                   size: 15,
              //                                 ),
              //                               ],
              //                             ),
              //                           ],
              //                         ),
              //                         Text(
              //                           ("\$120"),
              //                         ),
              //                       ],
              //                     ),
              //                   )
              //                 ],
              //               ),
              //             ),
              //           ),
              //         );
              //       }),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }
}





