// import "package:flutter/material.dart";
// import 'package:hexcolor/hexcolor.dart';
// import 'package:v2rp1/FE/navbar/navbar.dart';

// // import 'home_screen.dart';
// // import 'home_screen2.dart';

// String userId = "";
// String passwd = "";

// class LoadingScreen extends StatefulWidget {
//   const LoadingScreen({Key? key}) : super(key: key);

//   @override
//   _LoadingScreenState createState() => _LoadingScreenState();
// }

// class _LoadingScreenState extends State<LoadingScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         minimum: const EdgeInsets.only(
//           top: 50.0,
//           left: 16.0,
//           right: 16.0,
//           bottom: 50.0,
//         ),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             mainAxisSize: MainAxisSize.max,
//             children: [
//               const SizedBox(
//                 height: 35.0,
//               ),
//               Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Image.asset('images/kctgroupasli.png'),
//                     const SizedBox(
//                       height: 10.0,
//                     ),
//                     const Text(
//                       "Vindo Vessel Resource Planning",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 20.0,
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20.0,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 20.0,
//                         left: 40.0,
//                         right: 40.0,
//                         bottom: 10.0,
//                       ),
//                       child: TextFormField(
//                         keyboardType: TextInputType.text,
//                         onChanged: (value) {
//                           userId = value.toString().trim();
//                         },
//                         textAlign: TextAlign.center,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15.0)),
//                           labelText: 'User ID',
//                           hintText: 'Enter Your User ID',
//                           prefix: Icon(
//                             Icons.person,
//                             color: HexColor("#E6BF00"),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5.0,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 5.0,
//                         left: 40.0,
//                         right: 40.0,
//                         bottom: 10.0,
//                       ),
//                       child: TextFormField(
//                         keyboardType: TextInputType.text,
//                         obscureText: true,
//                         validator: (value) {
//                           if (value!.isEmpty) {
//                             return "Please Enter Your Password";
//                           }
//                           return null;
//                         },
//                         onChanged: (value) {
//                           passwd = value;
//                         },
//                         textAlign: TextAlign.center,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(15.0)),
//                           labelText: 'Password',
//                           hintText: 'Enter Your Password',
//                           prefix: Icon(
//                             Icons.lock,
//                             color: HexColor("#E6BF00"),
//                           ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20.0,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(
//                         top: 15.0,
//                         left: 40.0,
//                         right: 40.0,
//                         bottom: 20.0,
//                       ),
//                       child: MaterialButton(
//                         minWidth: double.infinity,
//                         height: 50.0,
//                         onPressed: () async {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => const Navbar(),
//                             ),
//                           );
//                         },
//                         child: const Text(
//                           "REGISTER",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20.0,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                         color: HexColor("#E6BF00"),
//                         elevation: 0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
