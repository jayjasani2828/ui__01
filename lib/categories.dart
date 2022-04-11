import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ui__01/appbar.dart';
import 'package:ui__01/bottamnavigation.dart';
import 'package:ui__01/dummydata.dart';
import 'package:ui__01/sidebar.dart';
import 'Model/categoryModel.dart';
import 'sizedata.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  List<CategoryModel> categoryList = [];
  bool isLoading = true;

  getRequest() async {
    var url = Uri.parse('http://merbed.org/farah/public/api/offer_category');
    var response = await http.get(url);
    setState(() {
      isLoading = true ;
    });
    var responceData = jsonDecode(response.body);
    if (responceData["success"] == 200) {
      responceData["data"].forEach((e) {
        categoryList.add(CategoryModel.fromJson(e));
      });
      setState(() {});
    } else {
      Fluttertoast.showToast(
        msg: responceData["message"],
      );
      setState(() {
        isLoading = false;
      });
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
        drawer: Sidebar(
          selectedIndex: 1,
        ),
        body: GridView.builder(
          itemCount: categoryList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 5, crossAxisCount: 2),
          itemBuilder: (context, index) {
            var item = categoryList[index];
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, "Silver_Wedding_package");
              },
              child: Card(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: sizedata.width! * .15,
                        height: sizedata.bodyheight! * .13,
                        child: isLoading
                            ? Image.network(item.image ?? "")
                            : CircularProgressIndicator(
                                color: Colors.black,
                                strokeWidth: 2,
                                backgroundColor: Colors.red),
                      ),
                      Text(
                        item.categoryName ?? "",
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
