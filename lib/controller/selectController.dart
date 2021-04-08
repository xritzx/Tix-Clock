import 'package:get/get.dart';

class SelectController extends GetxController {
  List<bool> cubes = List<bool>.filled(27, false, growable: false).obs;

  void clear() {
    for (var i = 0; i < cubes.length; i++) {
      cubes[i] = false;
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
}
