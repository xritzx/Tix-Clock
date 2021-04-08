import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tix/clockBlock.dart';
import 'package:tix/controller/selectController.dart';

class Clock extends StatelessWidget {
  Clock({Key key}) : super(key: key);
  final selectController = Get.put(SelectController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectController.clear();
                  },
                  child: Text("Clear"),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    selectController.selectAll();
                  },
                  child: Text("Select All"),
                ),
              ],
            ),
            ClockBlock(),
          ],
        ),
      ),
    );
  }
}
