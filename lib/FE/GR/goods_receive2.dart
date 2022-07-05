import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:v2rp1/FE/GR/allocation_gr.dart';
import 'package:v2rp1/FE/GR/goods_receive.dart';
import 'package:v2rp1/FE/GR/goods_receive3.dart';

class GoodsReceive2 extends StatefulWidget {
  const GoodsReceive2({Key? key}) : super(key: key);

  @override
  State<GoodsReceive2> createState() => _GoodsReceive2State();
}

class _GoodsReceive2State extends State<GoodsReceive2> {
  bool isVisible = false;
  final controllerSupplier = TextEditingController();
  final controllerWh = TextEditingController();
  final controllerPo = TextEditingController();

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
          title: const Text("Goods Receive"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GoodsReceive()),
              );
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextField(
                    controller: controllerSupplier,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.assignment_ind),
                      hintText: 'Supplier',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black)),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: controllerWh,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.warehouse),
                      hintText: 'Warehouse',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black)),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextField(
                    controller: controllerPo,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.article),
                      hintText: 'Purchase Order No.',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.black)),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () => setState(() => isVisible = !isVisible),
                    child: const Text('Load Data'),
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: HexColor('#E6BF00'),
                    ),
                  ),
                  Visibility(
                    visible: isVisible,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          color: Colors.black,
                          thickness: 0.8,
                          height: 25,
                        ),
                        const Text('Item List'),
                        const SizedBox(height: 15.0),
                        //list 1
                        ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5.0),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('BUKU001'),
                              TextButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const AllocationGR(
                                          title: "",
                                          descriptions: "",
                                          text: "Home",
                                          home: "OK",
                                        );
                                      });
                                },
                                child: Text(
                                  "Allocation",
                                  style: TextStyle(color: HexColor("#E6BF00")),
                                ),
                              ),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Buku panduan"),
                              const Text("Untuk Pelatihan Kru Baru"),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text("Qty PO : 10"),
                                  Text(
                                    "Qty Received : 10",
                                    style: TextStyle(
                                      color: Color.fromARGB(122, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Visibility(
          visible: isVisible,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('SAVE DATA'),
              ),
              onPressed: () async {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GoodsReceive3(),
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
      ),
    );
  }
}
