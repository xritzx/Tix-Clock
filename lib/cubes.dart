import 'package:flutter/material.dart';
import 'package:tix/controller/colorController.dart';
import 'package:tix/controller/selectController.dart';
import 'package:get/get.dart';

class Cube extends StatelessWidget {
  final int id;
  Cube(this.id, {Key key}) : super(key: key);

  final isSelected = false.obs;
  final color = Colors.red.obs;

  final colorController = Get.put(ColorController());
  final selectController = Get.put(SelectController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return GestureDetector(
          onTap: () {
            selectController.onToggle(id);
          },
          child: SizedBox(
            width: 60,
            height: 60,
            child: Container(
              decoration: BoxDecoration(
                color: selectController.cubes[id] ? Colors.blue : Colors.red,
                border: Border.all(
                  color:
                      selectController.cubes[id] ? Colors.white : color.value,
                  width: 2,
                ),
                boxShadow: selectController.cubes[id]
                    ? [
                        BoxShadow(
                          color: selectController.cubes[id]
                              ? Colors.blue
                              : Colors.red,
                          spreadRadius: 4,
                          blurRadius: 3,
                        ),
                      ]
                    : [],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(5),
              child: Center(
                child: Text(
                  this.id.toString(),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
