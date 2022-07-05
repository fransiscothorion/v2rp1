// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:v2rp1/FE/GR/goods_receive.dart';

// class HomeScreen3 extends StatelessWidget {
//   const HomeScreen3({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text("V2RP"),
//         elevation: 0,
//         backgroundColor: HexColor("#E6BF00"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_none),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Container(
//               height: size.height * 0.2,
//               decoration: BoxDecoration(
//                   color: HexColor("#E6BF00"),
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(50),
//                     bottomRight: Radius.circular(50),
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(34.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   //row 1
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       //GR
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(20),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: const Offset(0, 10),
//                               blurRadius: 60,
//                               color: Colors.black.withOpacity(0.20),
//                             ),
//                           ],
//                         ),
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20),
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           child: Column(
//                             children: [
//                               Ink.image(
//                                 image: const AssetImage('images/ic_gr.png'),
//                                 height: 130,
//                                 width: 140,
//                                 fit: BoxFit.fill,
//                                 child: InkWell(
//                                   splashColor: Colors.black38,
//                                   onTap: () async {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const GoodsReceive(),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                               ),
//                               const Text('Goods Receive'),
//                             ],
//                           ),
//                         ),
//                       ),
//                       //MU
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(20),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: const Offset(0, 10),
//                               blurRadius: 60,
//                               color: Colors.black.withOpacity(0.20),
//                             ),
//                           ],
//                         ),
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20),
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           child: Column(
//                             children: [
//                               Ink.image(
//                                 image:
//                                     const AssetImage('images/kctgroupasli.png'),
//                                 height: 130,
//                                 width: 140,
//                                 fit: BoxFit.fill,
//                                 child: InkWell(
//                                   splashColor: Colors.black38,
//                                   onTap: () async {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (context) => GoodsReceive(),
//                                     //   ),
//                                     // );
//                                   },
//                                 ),
//                               ),
//                               const Text('Material Use'),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   //row 2
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       //GR
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(20),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: const Offset(0, 10),
//                               blurRadius: 60,
//                               color: Colors.black.withOpacity(0.20),
//                             ),
//                           ],
//                         ),
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20),
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           child: Column(
//                             children: [
//                               Ink.image(
//                                 image: const AssetImage('images/ic_it.png'),
//                                 height: 130,
//                                 width: 140,
//                                 fit: BoxFit.fill,
//                                 child: InkWell(
//                                   splashColor: Colors.black38,
//                                   onTap: () async {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (context) => GoodsReceive(),
//                                     //   ),
//                                     // );
//                                   },
//                                 ),
//                               ),
//                               const Text('Internal Transfer'),
//                             ],
//                           ),
//                         ),
//                       ),
//                       //MU
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(20),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: const Offset(0, 10),
//                               blurRadius: 60,
//                               color: Colors.black.withOpacity(0.20),
//                             ),
//                           ],
//                         ),
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20),
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           child: Column(
//                             children: [
//                               Ink.image(
//                                 image: const AssetImage(
//                                     'images/ic_stmovement.png'),
//                                 height: 130,
//                                 width: 140,
//                                 fit: BoxFit.fill,
//                                 child: InkWell(
//                                   splashColor: Colors.black38,
//                                   onTap: () async {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (context) => GoodsReceive(),
//                                     //   ),
//                                     // );
//                                   },
//                                 ),
//                               ),
//                               const Text('Stock Movement'),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   //row ke 3
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       //GR
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(20),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: const Offset(0, 10),
//                               blurRadius: 60,
//                               color: Colors.black.withOpacity(0.20),
//                             ),
//                           ],
//                         ),
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20),
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           child: Column(
//                             children: [
//                               Ink.image(
//                                 image: const AssetImage(
//                                     'images/ic_stmovement.png'),
//                                 height: 130,
//                                 width: 140,
//                                 fit: BoxFit.fill,
//                                 child: InkWell(
//                                   splashColor: Colors.black38,
//                                   onTap: () async {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (context) => GoodsReceive(),
//                                     //   ),
//                                     // );
//                                   },
//                                 ),
//                               ),
//                               const Text('Stock Transfer'),
//                             ],
//                           ),
//                         ),
//                       ),
//                       //MU
//                       Container(
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.all(
//                             Radius.circular(20),
//                           ),
//                           boxShadow: [
//                             BoxShadow(
//                               offset: const Offset(0, 10),
//                               blurRadius: 60,
//                               color: Colors.black.withOpacity(0.20),
//                             ),
//                           ],
//                         ),
//                         child: Material(
//                           borderRadius: BorderRadius.circular(20),
//                           clipBehavior: Clip.antiAliasWithSaveLayer,
//                           child: Column(
//                             children: [
//                               Ink.image(
//                                 image: const AssetImage('images/ic_otp.png'),
//                                 height: 130,
//                                 width: 140,
//                                 fit: BoxFit.fill,
//                                 child: InkWell(
//                                   splashColor: Colors.black38,
//                                   onTap: () async {
//                                     // Navigator.push(
//                                     //   context,
//                                     //   MaterialPageRoute(
//                                     //     builder: (context) => GoodsReceive(),
//                                     //   ),
//                                     // );
//                                   },
//                                 ),
//                               ),
//                               const Text('OTP Verification'),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
