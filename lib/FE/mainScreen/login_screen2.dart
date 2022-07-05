// ignore_for_file: prefer_is_empty, unused_element, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'package:form_field_validator/form_field_validator.dart';
import 'package:v2rp1/BE/modelusers.dart';
// import 'package:v2rp1/FE/mainScreen/home_screen3.dart';
import 'package:v2rp1/BE/reqip.dart';

import '../navbar/navbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animatedController;
  late Animation<double> _animation;
  late final TextEditingController _usernameController =
      TextEditingController(text: '');
  late final TextEditingController _passwordController =
      TextEditingController(text: '');
  final bool _obsecuredText = true;

  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  String usernameValue = '';
  String _usernameLatestValue() {
    return usernameValue = ((_usernameController.text).isNotEmpty &&
            (_usernameController.text).length > 0
        ? _usernameController.text
        : '');
  }

  String passwordValue = '';
  String _passwordLatestValue() {
    return passwordValue = ((_passwordController.text).isNotEmpty &&
            (_passwordController.text).length > 0
        ? _passwordController.text
        : '');
  }

  @override
  void dispose() {
    _animatedController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    _animatedController =
        // AnimationController(vsync: this, duration: const Duration(20));
        AnimationController(vsync: this, duration: const Duration(seconds: 20));
    _animation =
        CurvedAnimation(parent: _animatedController, curve: Curves.linear)
          ..addListener(() {
            setState(() {});
          })
          ..addStatusListener((animationStatus) {
            if (animationStatus == AnimationStatus.completed) {
              _animatedController.reset();
              _animatedController.forward();
            }
          });
    _animatedController.forward();

    super.initState();
    _usernameController.addListener(() {
      _usernameLatestValue();
    });
    _passwordController.addListener(() {
      _passwordLatestValue();
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
                  "https://media.discordapp.net/attachments/957575427784855554/966553053832568852/vessel.png",
              placeholder: (context, url) => Image.asset(
                'images/vessel.png',
                fit: BoxFit.fill,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
              alignment: FractionalOffset(_animation.value, 0),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  children: [
                    SizedBox(
                      height: size.height * 0.1,
                    ),
                    SizedBox(
                      height: 150,
                      child: Image.asset('images/kctgroupasli.png'),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: _usernameController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Username",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter username';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: _obsecuredText,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 1) {
                          return 'Please Enter a valid password';
                        }
                        return null;
                        // return null;
                      },
                      controller: _passwordController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.cyan),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        processLoginData(context);
                        MsgHeader.Reqip();
                        // int trxid = DateTime.now().millisecondsSinceEpoch;
                        // print(trxid); //output: 1638592424384
                        // String datetime =
                        //     DateFormat("yyyyMMddhhmmss").format(DateTime.now());
                        // print(datetime); //output: 20220616020830
                        // HttpOverrides.global = MyHttpOverrides();
                        // try {
                        //   var response = await http.post(
                        //       Uri.https('www.v2rp.net', '/ptemp/'),
                        //       body: jsonEncode({
                        //         "trxid": "$trxid",
                        //         "datetime": "$datetime",
                        //         "requestipx": ""
                        //       }));
                        //   print(response.body);
                        //   var hasil = jsonDecode(response.body);
                        //   print('${hasil['responsecode']}');
                        //   print('${hasil['ip']}');
                        //   print('${hasil['message']}');
                        //   var responsecode = '${hasil['responsecode']}';
                        // } catch (e) {
                        //   print(e);
                        // }
                      },
                      //                     List responseJson = json.decode(response.body);
                      // return responseJson.map((m) => new Post.fromJson(m)).toList();

                      // onPressed: () async {
                      //   if (_formKey.currentState!.validate()) {
                      //     _formKey.currentState!.save();
                      //   } else if (_usernameLatestValue().isEmpty) {
                      //     setState(() {
                      //       ScaffoldMessenger.of(context).showSnackBar(
                      //         SnackBar(
                      //           backgroundColor: Colors.white,
                      //           elevation: 10.0,
                      //           shape: Border.all(
                      //               color: Colors.red,
                      //               width: 0.5,
                      //               style: BorderStyle.solid),
                      //           content: const Text(
                      //             "User Is Not Found!",
                      //             style: TextStyle(
                      //               color: Colors.black,
                      //               fontSize: 16.0,
                      //               fontWeight: FontWeight.bold,
                      //               letterSpacing: 1.0,
                      //             ),
                      //             textAlign: TextAlign.center,
                      //           ),
                      //         ),
                      //       );
                      //       _usernameController.clear();
                      //       _passwordController.clear();
                      //     });
                      //   }
                      // },

                      //////////////////////////

                      // onPressed: () async {
                      //   if (_formKey.currentState!.validate()) {
                      //     _formKey.currentState!.save();
                      //   }
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (context) => const Navbar(),
                      //     ),
                      //   );
                      // },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> processLoginData(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      ModelsUsers().userLoginModel(usernameValue, passwordValue).then(
        (loginFuture) {
          if (loginFuture.toString().contains('valid')) {
            // if (usernameValue.isNotEmpty) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Navbar(),
              ),
            );
            setState(() {
              _usernameController.clear();
              _passwordController.clear();
            });
          } else if (loginFuture.toString().contains('invalid')) {
            setState(
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.white,
                    elevation: 10.0,
                    shape: Border.all(
                        color: Colors.red,
                        width: 0.5,
                        style: BorderStyle.solid),
                    content: const Text(
                      "Password Is Wrong!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
                _usernameController.clear();
                _passwordController.clear();
                Timer(const Duration(seconds: 1), () {
                  Navigator.pushNamed(context, '/login');
                });
              },
            );
          } else if (loginFuture.toString().contains('not')) {
            setState(() {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.white,
                  elevation: 10.0,
                  shape: Border.all(
                      color: Colors.red, width: 0.5, style: BorderStyle.solid),
                  content: const Text(
                    "User is not registered!",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            });
          }
        },
      );
    }
  }
}
