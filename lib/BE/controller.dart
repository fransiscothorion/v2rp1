import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextControllers extends GetxController {
  @override
  void onInit() {
    super.onInit();
    usernameController.value.clear();
    passwordController.value.clear();
    vendor1Controller.value.clear();
    stocktableController.value.clear();
    fixassetController.value.clear();
  }

  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> vendor1Controller = TextEditingController().obs;
  Rx<TextEditingController> stocktableController = TextEditingController().obs;
  Rx<TextEditingController> fixassetController = TextEditingController().obs;
}
