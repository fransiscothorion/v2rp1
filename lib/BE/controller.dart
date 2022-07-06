import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextControllers extends GetxController {
  Rx<TextEditingController> usernameController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> vendor1Controller = TextEditingController().obs;
  Rx<TextEditingController> stocktableController = TextEditingController().obs;
}
