import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ui__01/Model/conectUsModel.dart';
import 'package:ui__01/sidebar.dart';
import 'sizedata.dart';
import 'package:http/http.dart' as http;

class Contact_Us extends StatefulWidget {
  @override
  _Contact_UsState createState() => _Contact_UsState();
}

class _Contact_UsState extends State<Contact_Us> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  ContectUsModel? data;

  getRequest() async {
    var url = Uri.parse("http://merbed.org/farah/public/api/contact_us");
    var response = await http.get(url);
    var responceData = jsonDecode(response.body);
    if (responceData["success"] == 200) {
      data = ContectUsModel.fromJson(responceData["data"]);
      setState(() {});
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
      body: Padding(
        padding: const EdgeInsets.only(left: 17, top: 55, right: 17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                _key.currentState!.openDrawer();
              },
              child: Container(
                width: sizedata.width! * .07,
                child: SvgPicture.asset("Assets/contect_Us/Path 120.svg"),
              ),
            ),
            Center(
              child: Container(
                width: sizedata.width! * .40,
                height: sizedata.width! * .40,
                child: SvgPicture.asset("Assets/contect_Us/Group 1.svg"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "App Version",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    data?.appVersion ?? "",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Phone",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    data?.phoneNumber ?? "",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    data?.email ?? "",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  width: sizedata.width! * .09,
                  height: sizedata.width! * .09,
                  child: SvgPicture.asset("Assets/contect_Us/instagram.svg"),
                ),
                Text(
                  "Instagram",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  width: sizedata.width! * .09,
                  height: sizedata.width! * .09,
                  child: SvgPicture.asset("Assets/contect_Us/facebook (1).svg"),
                ),
                Text(
                  "Facebook",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  width: sizedata.width! * .09,
                  height: sizedata.width! * .09,
                  child: SvgPicture.asset("Assets/contect_Us/youtube.svg"),
                ),
                Text(
                  "YouTube",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  width: sizedata.width! * .09,
                  height: sizedata.width! * .09,
                  child: SvgPicture.asset("Assets/contect_Us/twitter.svg"),
                ),
                Text(
                  "Twitter",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 15, bottom: 15, right: 20),
                  width: sizedata.width! * .09,
                  height: sizedata.width! * .09,
                  child: SvgPicture.asset("Assets/contect_Us/linkedin.svg"),
                ),
                Text(
                  "Linkedin",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColor.greyColor,
            ),
          ],
        ),
      ),
      drawer: Sidebar(selectedIndex: 4),
    );
  }
}
