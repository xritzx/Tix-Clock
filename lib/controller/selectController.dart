import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectController extends GetxController {
  List<bool> cubes = List<bool>.filled(27, false, growable: false).obs;
  List<Color> cubeColors =
      List<Color>.filled(27, Colors.grey, growable: false).obs;

  var color = Colors.black.obs;

  void clear() {
    for (var i = 0; i < cubes.length; i++) {
      cubes[i] = false;
    }
  }

  void changeColor(Color _color) {
    color.value = _color;
    for (var i = 0; i < cubes.length; i++) {
      if (cubes[i]) {
        applyColor(i);
      }
    }
  }

  void onToggle(int id) {
    cubes[id] = !cubes[id];
  }

  void selectAll() {
    for (var i = 0; i < cubes.length; i++) {
      cubes[i] = true;
    }
  }

  void applyColor(int id) {
    cubeColors[id] = color.value;
  }
}
