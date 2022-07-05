import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:v2rp1/FE/MU/material_use2.dart';

import 'dialog_box.dart';

class MaterialUse3 extends StatelessWidget {
  const MaterialUse3({Key? key}) : super(key: key);

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
          title: const Text("Transaction Detail"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MaterialUse2()),
              );
            },
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Material Use Detail'),
                      const SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Material Use No.'),
                          Text('NEP/IJ2200003'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Warehouse'),
                          Text('Varita'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Admin'),
                          Text('Log & WH Staff PAP 1'),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 0.8,
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('SPPBJ No.'),
                          Text('SPPBJ/2022/03-00001'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Requestor'),
                          Text('BM Crewing 1'),
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                        thickness: 0.8,
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Item List'),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Delete All',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Slidable(
                        key: const ValueKey(0),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          dismissible: DismissiblePane(
                            onDismissed: () {},
                          ),
                          children: const [
                            SlidableAction(
                              onPressed: null,
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5.0),
                          title: const Text('SEPATUSAFETY001'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Sepatu Safety Caterpillar High Ankle'),
                              Text('Untuk kru kapal'),
                            ],
                          ),
                          trailing: Text(
                            '20x',
                            style: TextStyle(
                              color: HexColor('#E6BF00'),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                      Slidable(
                        key: const ValueKey(1),
                        startActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          dismissible: DismissiblePane(
                            onDismissed: () {},
                          ),
                          children: const [
                            SlidableAction(
                              onPressed: null,
                              backgroundColor: Color(0xFFFE4A49),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 5.0),
                          title: const Text('BUKU001'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Buku Panduan K3'),
                              Text('Untuk pelatihan kru baru'),
                            ],
                          ),
                          trailing: Text(
                            '10x',
                            style: TextStyle(
                              color: HexColor('#E6BF00'),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
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
              child: Text('SUBMIT'),
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CustomDialogBox(
                      title: "SUBMIT DATA SUCCESFUL",
                      descriptions: "Material Use No.NEP/IJ2200003",
                      text: "Home",
                      home: "OK",
                      img: Image.asset("images/success.gif"),
                    );
                  });
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

// class _MaterialUse3State extends State<MaterialUse3> {
//   @override
//   Widget buisld(BuildContext context) {
//     return Scaffold(
      
//     );
//   }
// }
