import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v2rp1/FE/MU/material_use2.dart';
import 'package:v2rp1/FE/navbar/navbar.dart';
import 'package:v2rp1/additional/list_MU.dart';

class MaterialUse extends StatefulWidget {
  const MaterialUse({Key? key}) : super(key: key);

  @override
  State<MaterialUse> createState() => _MaterialUseState();
}

class _MaterialUseState extends State<MaterialUse> {
  final controller = TextEditingController();
  List<ListMU> muList = allListMU;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are u sure?'),
            content: const Text('Do you want to exit the App?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Yes'),
              ),
            ],
          ),
        );
        throw (e);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Material Use"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Navbar()),
              );
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    // alignment: MainAxisAlignment.spaceBetween,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Material Used List',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 2.0, right: 8.0),
                  //   child: CupertinoSearchTextField(
                  //     borderRadius: BorderRadius.circular(7),
                  //   ),
                  // ),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black)),
                    ),
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: muList.length,
                  //     itemBuilder: (context, index) {
                  //       final ListMU = muList[index];
                  //       return ListTile(
                  //         title: Text(ListMU.noSPPBJ),
                  //       );
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('CREATE NEW'),
            ),
            onPressed: () async {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MaterialUse2(),
                ),
              );
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: HexColor('#E6BF00'),
            ),
          ),
        ),
      ),
    );
  }
}
