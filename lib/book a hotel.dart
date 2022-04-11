import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui__01/Book_a_hotel_page.dart';
import 'package:ui__01/Model/Book_a_hotel_page_Model.dart';
import 'package:ui__01/appbar.dart';
import 'package:ui__01/sidebar.dart';
import 'Model/Book_A_hotel_Model.dart';
import 'bottamnavigation.dart';
import 'ongenerate.dart';
import 'sizedata.dart';
import 'package:http/http.dart' as http;

class Book_A_Hotel extends StatefulWidget {
  RouteArguments arg;

  Book_A_Hotel({required this.arg});

  @override
  _Book_A_HotelState createState() => _Book_A_HotelState();
}

class _Book_A_HotelState extends State<Book_A_Hotel> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

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
    sizedata(context);
    return Scaffold(
      key: _key,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
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
      ),
      drawer: Sidebar(),
      body: GridView.builder(
        itemCount: bookHModel?.products?.length ?? 0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 5),
        itemBuilder: (ctx, index) {
          var item = bookHModel!.products![index];
          return Container(
            width: sizedata.width! * .4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(item.productImage ?? ""),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            item.productName ?? "",
                            style: TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 14),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5, top: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      item.rate.toString(),
                                      style: TextStyle(
                                        color: AppColor.primaryColor,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      "/ Per Day",
                                      style: TextStyle(
                                          fontSize: sizedata.width! * 0.028),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: sizedata.width! * .14,
                                  child: Image(
                                    image: AssetImage(
                                        "Assets/book_a_hotel/Group 629.png"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 10),
                            child: Text(
                              item.address ?? "",
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return Book_a_hotel_page(productid: item.productId ?? 0, servicesListId: item.serviceListId ?? 0);
                              },));
                            },
                            child: Container(
                              height: sizedata.bodyheight! * .04,
                              margin: EdgeInsets.only(bottom: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: AppColor.primaryColor,
                                borderRadius: BorderRadius.circular(06),
                              ),
                              child: Text(
                                "Book Now",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
