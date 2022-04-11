import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui__01/login.dart';
import 'package:ui__01/ongenerate.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  runApp(ui_1());
}

class ui_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerater.generateRoute,
      initialRoute: "/",
      // routes: {
      //   "/services0": (context) => BookingServices(),
      //   "/services1": (context) => Book_A_Hotel(),
      //   "/services2": (context) => SalonServices(),
      //   "/services3": (context) => LadiesServices(),
      //   "/services4": (context) => Dresses(),
      // },
      title: "First ui",
      home: Login(),
      theme: ThemeData(primarySwatch: Colors.purple),
      debugShowCheckedModeBanner: false,
    );
  }
}