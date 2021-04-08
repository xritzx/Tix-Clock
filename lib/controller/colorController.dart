import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ColorController extends GetxController {
  var color = Colors.black.obs;
  void change(var _color) {
    color = _color;
  }
}
