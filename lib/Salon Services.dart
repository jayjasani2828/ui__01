import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui__01/appbar.dart';
import 'package:ui__01/sidebar.dart';
import 'Model/slonServicesModel.dart';
import 'bottamnavigation.dart';
import 'sizedata.dart';
import 'package:http/http.dart' as http;

class SalonServices extends StatefulWidget {
  @override
  _SalonServicesState createState() => _SalonServicesState();
}

class _SalonServicesState extends State<SalonServices> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  List<SalonServicesModel> salonServicesLst = [];

  getRequestHomePage() async {
    var url = Uri.parse("http://merbed.org/farah/public/api/service_list");
    var response = await http.post(url, body: {"service_id": "7"});
    var responceData = jsonDecode(response.body);
    if (responceData["success"] == 200) {
      responceData["data"].forEach((e) {
        salonServicesLst.add(SalonServicesModel.fromJson(e));
      });
      setState(() {});
    } else {
      Fluttertoast.showToast(msg: responceData["message"]);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRequestHomePage();
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
        drawer: Sidebar(),
        body: ListView.builder(
          itemCount: salonServicesLst.length,
          itemBuilder: (context, index) {
            var item = salonServicesLst[index];
            return Padding(
              padding: const EdgeInsets.only(left: 17, right: 17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.serviceName ?? ""),
                  Container(
                    width: double.infinity,
                    // height: 300,
                    child: Image.network(item.image ?? ""),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 17, right: 17, top: 17),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              height: sizedata.bodyheight! * .12,
                              decoration: BoxDecoration(),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    width: sizedata.width! * .10,
                                    child: SvgPicture.asset(
                                      "Assets/Salon Services/woman (1).svg",
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text("Hair"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              height: sizedata.bodyheight! * .12,
                              decoration: BoxDecoration(),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    width: sizedata.width! * .10,
                                    child: SvgPicture.asset(
                                      "Assets/Salon Services/hello.svg",
                                    ),
                                  ),
                                  Text("Hair Removal"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              height: sizedata.bodyheight! * .12,
                              decoration: BoxDecoration(),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Container(
                                    width: sizedata.width! * .08,
                                    child: SvgPicture.asset(
                                      "Assets/Salon Services/healthcare-and-medical.svg",
                                    ),
                                  ),
                                  Text("Body care"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
