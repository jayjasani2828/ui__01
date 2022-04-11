import 'package:flutter/material.dart';
import 'package:ui__01/Book_a_hotel_page.dart';
import 'package:ui__01/Booking%20Services.dart';
import 'package:ui__01/Contact%20Us.dart';
import 'package:ui__01/Dresses.dart';
import 'package:ui__01/Ladies%20Services.dart';
import 'package:ui__01/Salon%20Services.dart';
import 'package:ui__01/Silver%20Wedding%20package.dart';
import 'package:ui__01/book%20a%20hotel.dart';
import 'package:ui__01/categories.dart';
import 'package:ui__01/homepage.dart';
import 'package:ui__01/login.dart';
import 'package:ui__01/my%20account.dart';
import 'package:ui__01/offers%20and%20packages.dart';
import 'package:ui__01/settings.dart';
import 'package:ui__01/single%20services.dart';
import 'package:ui__01/singup.dart';

class RouteArguments {
  int? id;
  dynamic params;

  RouteArguments({this.id, this.params});
}

class RouteGenerater {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args;
    if (settings.arguments != null) {
      args = settings.arguments as RouteArguments?;
    }

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => Login());
      case "/singup":
        return MaterialPageRoute(builder: (_) => Singup());
      case "/homepage":
        return MaterialPageRoute(builder: (_) => Homepage());
      case "/categories":
        return MaterialPageRoute(builder: (_) => Categories());
      case "/offers_and_packages":
        return MaterialPageRoute(builder: (_) => Offers_and_Packages());
      case "/singleServices":
        return MaterialPageRoute(builder: (_) => SingleServices());
      case "/bookingServices":
        return MaterialPageRoute(builder: (_) => BookingServices());
      case "/book_A_Hotel":
        return MaterialPageRoute(builder: (_) => Book_A_Hotel(arg: args));
      case "/SalonServices":
        return MaterialPageRoute(builder: (_) => SalonServices());
      case "/LadiesServices":
        return MaterialPageRoute(
            builder: (_) => LadiesServices(
                  arg: args,
                ));
      case "/Dresses":
        return MaterialPageRoute(builder: (_) => Dresses());
      case "/MyAccount":
        return MaterialPageRoute(builder: (_) => MyAccount());
      case "/Settings":
        return MaterialPageRoute(builder: (_) => Settings());
      case "/Contact_Us":
        return MaterialPageRoute(builder: (_) => Contact_Us());

      case "Silver_Wedding_package":
        return MaterialPageRoute(builder: (_) => Silver_Wedding_package());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: SafeArea(
              child: Text("Route Eeeor"),
            ),
          ),
        );
    }
  }
}
