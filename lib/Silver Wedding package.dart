import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui__01/appbar.dart';
import 'package:ui__01/bottamnavigation.dart';
import 'package:ui__01/sidebar.dart';
import 'sizedata.dart';

class Silver_Wedding_package extends StatefulWidget {
  @override
  _Silver_Wedding_packageState createState() => _Silver_Wedding_packageState();
}

class _Silver_Wedding_packageState extends State<Silver_Wedding_package> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  int changePage = 0;

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
        body: Padding(
          padding: const EdgeInsets.only(left: 17, right: 17),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: [1, 2, 3, 4, 5].map((e) {
                  return Container(
                    width: double.infinity,
                    child: Image.asset(
                        "Assets/Book a hotel page/saad-khan-425b2PhNuHA-unsplash.png"),
                  );
                }).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index1, reason) {
                    setState(() {
                      changePage = index1;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate([1, 2, 3, 4, 5].length, (index) {
                      return Container(
                        width: 9,
                        height: 9,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: changePage == index
                              ? AppColor.primaryColor
                              : Colors.grey,
                        ),
                      );
                    }),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Coast Hotels",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star_border_purple500_outlined,
                      ),
                      Icon(Icons.star_border),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 8),
                child: Text(
                  "Details",
                  style: TextStyle(fontSize: 19),
                ),
              ),
              Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. "),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Text(
                    "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
              ),
              Text(
                  "Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum."),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "\$35000",
                          style: TextStyle(
                              fontSize: 18, color: AppColor.primaryColor),
                        ),
                        Text("/ Per Day"),
                      ],
                    ),
                    Container(
                      width: sizedata.width! * .30,
                      height: sizedata.width! * .12,
                      decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(08),
                      ),
                      child: TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(60),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: sizedata.height! * .50,
                                padding: EdgeInsets.only(left: 50, right: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 50,
                                      ),
                                      child: Text(
                                        "You Booking is Placed ",
                                        style: TextStyle(
                                            fontSize: 24,
                                            color: AppColor.primaryColor),
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(
                                            top: 30, bottom: 15),
                                        width: sizedata.width! * .20,
                                        height: sizedata.width! * .20,
                                        child: SvgPicture.asset(
                                            "Assets/ShowModelBottomSheet/checkmark.svg")),
                                    Text(
                                      "our team will contact you shortly after you proceed to payment",
                                      style: TextStyle(fontSize: 17),
                                    ),
                                    Container(
                                      width: sizedata.width! * .40,
                                      height: sizedata.width! * .12,
                                      margin: EdgeInsets.only(top: 30),
                                      decoration: BoxDecoration(
                                          color: AppColor.primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Make Payment",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        child: Text(
                          "Book Now",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
