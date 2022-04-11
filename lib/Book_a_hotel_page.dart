import 'dart:convert';
import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:ui__01/Model/Book_a_hotel_page_Model.dart';
import 'package:ui__01/bottamnavigation.dart';
import 'package:ui__01/sidebar.dart';
import 'sizedata.dart';
import 'package:http/http.dart' as http;

class Book_a_hotel_page extends StatefulWidget {
  int productid;
  int servicesListId;

  Book_a_hotel_page({required this.productid, required this.servicesListId});

  @override
  _Book_a_hotel_pageState createState() => _Book_a_hotel_pageState();
}

class _Book_a_hotel_pageState extends State<Book_a_hotel_page> {
  GlobalKey<ScaffoldState> _key = GlobalKey();
  int changePage = 0;
  int changeColor = 0;
  int newColor = 0;
  int selactTimeData = 0;
  var formateDate;

  Book_a_hotel_page_Model? productDetail;
  ProductAvailability? selectedProductAvailability;

  grtrequest(String product, String service) async {
    var url = Uri.parse('http://merbed.org/farah/public/api/product_details');
    var response = await http
        .post(url, body: {"product_id": product, "service_list_id": service});
    var responseData = jsonDecode(response.body);
    if (responseData["success"] == 200) {
      productDetail = Book_a_hotel_page_Model.fromJson(responseData["data"]);
      setState(() {});
    } else {
      Fluttertoast.showToast(msg: responseData['message']);
    }
  }

  List<DateTime> dateData1({required String datest, required String dateen}) {
    var date1 = DateTime.parse("2000-00-00 " + datest);
    var date2 = DateTime.parse("2000-00-00 " + dateen);

    List<DateTime> lst = [];

    do {
      print(date1);
      lst.add(date1);
      date1 = date1.add(Duration(minutes: 30));
    } while (date1.isBefore(date2));
    return lst;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    grtrequest(widget.productid.toString(), widget.servicesListId.toString());
  }

  @override
  Widget build(BuildContext context) {
    final _currentDate = DateTime.now();
    final _dayFormatter = DateFormat('d');
    final _monthFormatter = DateFormat('MMM');
    final _day = DateFormat("EEE");

    int currentHours = new DateTime.now().hour;
    int val1 = 24 - currentHours;

    var timeList = List.generate(val1, (index) {
      return DateTime.now().add(Duration(hours: index));
    });

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
          padding: EdgeInsets.only(left: 17, right: 17),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselSlider(
                  items: productDetail?.productImages?.map((e) {
                        return Container(
                            width: double.infinity,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            child: Image.network(
                              productDetail?.productImages![changePage].image ??
                                  "",
                              fit: BoxFit.fill,
                            ));
                      }).toList() ??
                      [],
                  options: CarouselOptions(
                    viewportFraction: 1,
                    onPageChanged: (index1, reason) {
                      setState(() {
                        changePage = index1;
                        print(changePage);
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...List.generate(
                          int.parse(productDetail?.productImages?.length
                                      .toString() ??
                                  "0")
                              .toInt(), (index) {
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
                      productDetail?.productName ?? "",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star, color: Colors.amber),
                        Icon(Icons.star_border_purple500_outlined),
                        Icon(Icons.star_border),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Icon(Icons.location_on_outlined),
                      Expanded(
                        child: Text(
                          productDetail?.address ?? "",
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  child: Text(
                    "Details",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Text(productDetail?.description ?? ""),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Text(
                    "Pick the Date",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 90,
                  child: GridView.builder(
                    itemCount: productDetail?.productAvailability?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1, childAspectRatio: 18 / 15),
                    itemBuilder: (context, index) {
                      var item = productDetail?.productAvailability?[index];
                      var date = DateTime.parse(item?.date ?? "");
                      return InkWell(
                        onTap: () {
                          setState(() {
                            changeColor = index;
                            selectedProductAvailability = item;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: changeColor == index
                                ? AppColor.primaryColor
                                : Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _monthFormatter.format(date),
                                style: TextStyle(
                                    color: changeColor == index
                                        ? Colors.white
                                        : AppColor.primaryColor),
                              ),
                              Text(
                                _dayFormatter.format(date),
                                style: TextStyle(
                                    color: changeColor == index
                                        ? Colors.white
                                        : AppColor.primaryColor),
                              ),
                              Text(
                                _day.format(date),
                                style: TextStyle(
                                    color: changeColor == index
                                        ? Colors.white
                                        : AppColor.primaryColor),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    "Available Time Slot",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                if (selectedProductAvailability != null &&
                    selectedProductAvailability!.timeSlote != null &&
                    selectedProductAvailability!.timeSlote!.isNotEmpty)
                  // SingleChildScrollView(
                  //   scrollDirection: Axis.horizontal,
                  //   child: Row(
                  //     children: [
                  //       ...selectedProductAvailability!.timeSlote!.map(
                  //         (e) => Row(
                  //           children: [
                  //             ...dateData1(
                  //                     datest: e.startTime ?? "19:47:00",
                  //                     dateen: e.endTime ?? "20:47:00")
                  //                 .map(
                  //               (e) => InkWell(
                  //                 onTap: () {
                  //                   setState(() {});
                  //                 },
                  //                 child: Container(
                  //                   width: 70,
                  //                   height: 40,
                  //                   alignment: Alignment.center,
                  //                   margin: EdgeInsets.all(5),
                  //                   decoration: BoxDecoration(
                  //                       color: Colors.amber,
                  //                       borderRadius:
                  //                           BorderRadius.circular(10)),
                  //                   child: Text("${e.hour}:${e.minute}"),
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: selectedProductAvailability?.timeSlote?.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            ...selectedProductAvailability!.timeSlote!.map(
                              (e) => Row(
                                children: [
                                  ...dateData1(
                                          datest: e.startTime ?? "19:47:00",
                                          dateen: e.endTime ?? "20:47:00")
                                      .map(
                                    (en) => InkWell(
                                      onTap: () {
                                        setState(() {
                                          selactTimeData = en.hour;
                                        });
                                      },
                                      child: Container(
                                        width: 70,
                                        height: 40,
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: selactTimeData == en.hour
                                                ? AppColor.primaryColor
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Text(
                                          "${en.hour}:${en.minute}",
                                          style: TextStyle(
                                              color: selactTimeData == en.hour
                                                  ? Colors.white
                                                  : AppColor.primaryColor),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "\$ ${productDetail?.rate ?? ""}",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                        "we will send you a confirmation email after you proceed to payment",
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
        ),
        bottomNavigationBar: BottomNavigation());
  }
}
