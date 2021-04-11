import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:tix/clockBlock.dart';
import 'package:tix/controller/selectController.dart';

class Clock extends StatelessWidget {
  Clock({Key key}) : super(key: key);

  var selectState = false.obs;
  final selectController = Get.put(SelectController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Spacer(),
                    IconButton(
                      iconSize: 40,
                      padding: EdgeInsets.all(10),
                      color: Colors.white,
                      icon: !selectState.value
                          ? Icon(Icons.select_all)
                          : Icon(Icons.highlight_remove_sharp),
                      onPressed: () {
                        selectState.value
                            ? selectController.clear()
                            : selectController.selectAll();
                        selectState.value = !selectState.value;
                      },
                    ),
                    Spacer(),
                    IconButton(
                      iconSize: 40,
                      padding: EdgeInsets.all(10),
                      icon: Icon(Icons.color_lens),
                      color: Colors.white,
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              titlePadding: const EdgeInsets.all(0.0),
                              contentPadding: const EdgeInsets.all(0.0),
                              content: SingleChildScrollView(
                                child: ColorPicker(
                                  pickerColor: selectController.color.value,
                                  onColorChanged: selectController.changeColor,
                                  colorPickerWidth: 250.0,
                                  pickerAreaHeightPercent: 0.8,
                                  displayThumbColor: true,
                                  enableAlpha: false,
                                  showLabel: false,
                                  paletteType: PaletteType.hsv,
                                  pickerAreaBorderRadius:
                                      const BorderRadius.only(
                                    topLeft: const Radius.circular(2.0),
                                    topRight: const Radius.circular(2.0),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                    Spacer()
                  ],
                ),
                Obx(
                  () => selectController.isLoading.value
                      ? Center(
                          child: SizedBox(
                            height: Get.height * 0.44,
                            child: SpinKitPouringHourglass(
                              color: Colors.white,
                              size: 40.0,
                            ),
                          ),
                        )
                      : ClockBlock(),
                )
              ],
            ),
          ),
        ));
  }
}
