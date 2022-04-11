// import 'package:flutter/material.dart';
// import 'package:ui__01/sizedata.dart';
//
// class appBara extends StatefulWidget {
//
//   @override
//   State<appBara> createState() => _appBarState();
// }
//
// class _appBarState extends State<appBara> {
//   GlobalKey<ScaffoldState> _key = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     sizedata(context);
//     return AppBar(
//       key: _key,
//       elevation: 0,
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       title: Container(
//         width: sizedata.width! / 5,
//         child: Image(
//           image: AssetImage("Assets/homepage/Group 1.png"),
//         ),
//       ),
//       actions: [
//         Container(
//           width: 24,
//           child: Image(
//             image: AssetImage("Assets/homepage/search.png"),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(left: 20, right: 17),
//           width: 24,
//           child: Image(
//             image: AssetImage("Assets/homepage/shopping-bag.png"),
//           ),
//         ),
//       ],
//       leading: IconButton(
//         icon: Image(
//           image: AssetImage("Assets/homepage/Path 120.png"),
//           width: 22,
//         ),
//         onPressed: () {
//           _key.currentState!.openDrawer();
//         },
//       ),
//     );
//   }
// }