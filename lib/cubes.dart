import 'package:flutter/material.dart';
import 'package:tix/controller/selectController.dart';
import 'package:get/get.dart';

class Cube extends StatelessWidget {
  final int id;
  Cube(this.id, {Key key}) : super(key: key);

  final selectController = Get.put(SelectController());

  final isSelected = false.obs;

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
                color: selectController.cubeColors[id],
                border: Border.all(
                  color: selectController.cubes[id]
                      ? Colors.white
                      : Colors.white54,
                  width: 1,
                ),
                boxShadow: selectController.cubes[id]
                    ? [
                        BoxShadow(
                          color: selectController.cubes[id]
                              ? Colors.white54
                              : selectController.cubeColors[id],
                          spreadRadius: 4,
                          blurRadius: 4,
                        ),
                      ]
                    : [],
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.all(5),
              // child: Center(
              //   child: Text(
              //     this.id.toString(),
              //   ),
              // ),
            ),
          ),
        );
      },
    );
  }
}
