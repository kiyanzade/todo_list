import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class TextFiledController extends GetxController {
  TextEditingController? titleController;
  TextEditingController? noteController;

  @override
  void onInit() {
    titleController = TextEditingController();
    noteController = TextEditingController();
    super.onInit();
  }
}
