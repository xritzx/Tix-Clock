import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:tix/controller/selectController.dart';

class FirebaseService extends GetxService {
  final database = FirebaseDatabase.instance.reference();

  Color _getColorFromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return Color(int.parse("0x$hexColor"));
  }

  Future<List<Color>> fetchColorList() async {
    DataSnapshot data = await database.once();
    List<Color> colorList = [];
    for (int i = 0; i < data.value.length; i++) {
      colorList.add(_getColorFromHex(data.value[i]));
    }
    return colorList;
  }

  void updateColorList(List<Color> colorList) async {
    Map<String, String> colorListHex = new Map<String, String>();
    for (int i = 0; i < colorList.length; i++) {
      colorListHex[i.toString()] =
          '#${(colorList[i].value & 0xFFFFFF).toRadixString(16).padLeft(6, '0').toUpperCase()}';
    }
    database.update(colorListHex);
  }
}
