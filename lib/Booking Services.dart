import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:ui__01/Model/BookingServicesModel.dart';
import 'package:ui__01/ongenerate.dart';
import 'package:ui__01/sidebar.dart';
import 'bottamnavigation.dart';
import 'sizedata.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class BookingServices extends StatefulWidget {
  @override
  _BookingServicesState createState() => _BookingServicesState();
}

class _BookingServicesState extends State<BookingServices> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  bool isLoading = false;
  List<bookingServices> servicesList = [];

  getRequestBookingServices() async {
    var url = Uri.parse('http://merbed.org/farah/public/api/service_list');
    var response = await http.post(url, body: {"service_id": "5"});
    setState(() {
      isLoading = true;
    });
    var responseData = jsonDecode(response.body);
    if (responseData["success"] == 200) {
      responseData["data"].forEach((e) {
         servicesList.add(bookingServices.fromJson(e));
      });
      setState(() {});
    } else {
      Fluttertoast.showToast(msg: responseData["message"]);
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequestBookingServices();
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
        drawer: Sidebar(),
        body: ListView.builder(
          itemCount: servicesList.length,
          itemBuilder: (context, index) {
            var item = servicesList[index];
            return InkWell(
              onTap: () {
                if (item.isSubCategory == 1) {
                  Navigator.pushNamed(context, "/LadiesServices",
                      arguments: RouteArguments(id: item.serviceListId));
                } else {
                  Navigator.pushNamed(context, "/book_A_Hotel",
                      arguments: RouteArguments(id: item.serviceListId));
                }
              },
              child: Column(
                children: [
                  isLoading
                      ? Container(
                          margin: EdgeInsets.only(left: 17, right: 17, top: 17),
                          width: double.infinity,
                          child: Image.network(
                            item.image ?? "",
                          ),
                        )
                      : CircularProgressIndicator(
                          color: Colors.black, backgroundColor: Colors.black),
                  Container(
                    width: double.infinity,
                    height: sizedata.bodyheight! * .07,
                    margin: EdgeInsets.only(left: 17, right: 17),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 0),
                          color: AppColor.greyColor,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            (item.serviceName ?? "") + "${item.serviceListId}",
                            style: TextStyle(
                                fontSize: 20, color: AppColor.primaryColor),
                          ),
                          Container(
                            width: sizedata.width! * .07,
                            child: Image(
                              image: AssetImage(
                                  "Assets/Booking Services/Group 514.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
