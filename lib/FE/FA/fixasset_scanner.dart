// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, non_constant_identifier_names, unnecessary_null_comparison

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:v2rp1/BE/controller.dart';
import 'package:v2rp1/FE/FA/fixasset.dart';

class ScanFixAsset extends StatefulWidget {
  const ScanFixAsset({Key? key}) : super(key: key);

  @override
  State<ScanFixAsset> createState() => _ScanFixAssetState();
}

class _ScanFixAssetState extends State<ScanFixAsset> {
  MobileScannerController cameraController = MobileScannerController();

  static var codeBarcode;
  static TextControllers textControllers = Get.put(TextControllers());

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
          title: const Text("Scanner"),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          actions: [
            IconButton(
              color: const Color.fromARGB(255, 139, 0, 0),
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state as TorchState) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off, color: Colors.grey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on, color: Colors.yellow);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: const Color.fromARGB(255, 106, 0, 0),
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state as CameraFacing) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: 32.0,
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: MobileScanner(
          allowDuplicates: false,
          controller: cameraController,
          onDetect: (barcode, args) {
            codeBarcode = barcode.rawValue;
            debugPrint('Barcode found! $codeBarcode');
            Get.snackbar(
              "Barcode Found!",
              "$codeBarcode",
              icon: const Icon(Icons.qr_code),
              backgroundColor: Colors.green,
              isDismissible: true,
              dismissDirection: DismissDirection.horizontal,
            );
            Get.to(() => const FixAsset());
            setState(() {
              cameraController.stop();
              textControllers.fixassetController.value.text = codeBarcode;
            });
          },
        ),
      ),
    );
  }
}
