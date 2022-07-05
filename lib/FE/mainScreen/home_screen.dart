// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: HexColor("#E6BF00"),
//         title: const Text("V2RP"),
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_none),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Container(
//                 // color: HexColor("#E6BF00"),
//                 height: size.height * 0.25,
//                 decoration: BoxDecoration(
//                     color: HexColor("#E6BF00"),
//                     borderRadius: const BorderRadius.only(
//                       bottomLeft: Radius.circular(46),
//                       bottomRight: Radius.circular(46),
//                     )),
//               ),
//               Positioned(
//                 child: Container(
//                   margin:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
//                   height: size.height * 0.35,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: const BorderRadius.all(
//                       Radius.circular(20),
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         offset: const Offset(0, 10),
//                         blurRadius: 60,
//                         color: Colors.grey.withOpacity(0.20),
//                       ),
//                     ],
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       children: [
//                         InkWell(
//                           onTap: () {},
//                           child: Ink.image(
//                             image: const AssetImage(
//                               'images/kctgroupasli.png',
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
