// import 'package:flutter/material.dart';
// import 'package:form_field_validator/form_field_validator.dart';

// class TestLogin extends StatefulWidget {
//   const TestLogin({Key? key}) : super(key: key);

//   @override
//   State<TestLogin> createState() => _TestLoginState();
// }

// class _TestLoginState extends State<TestLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Form(
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: 50.0,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: TextFormField(
//                       decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Email',
//                           hintText: 'Enter valid email id as abc@gmail.com'),
//                       validator: MultiValidator([
//                         RequiredValidator(errorText: "* Required"),
//                         EmailValidator(errorText: "Enter valid email id"),
//                       ])),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(
//                       left: 15.0, right: 15.0, top: 15, bottom: 0),
//                   child: TextFormField(
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           labelText: 'Password',
//                           hintText: 'Enter secure password'),
//                       validator: MultiValidator([
//                         RequiredValidator(errorText: "* Required"),
//                         MinLengthValidator(6,
//                             errorText:
//                                 "Password should be atleast 6 characters"),
//                         MaxLengthValidator(15,
//                             errorText:
//                                 "Password should not be greater than 15 characters")
//                       ])
//                       //validatePassword,        //Function to check validation
//                       ),
//                 ),
//                 TextButton(onPressed: () {}, child: Text('Submit'))
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
