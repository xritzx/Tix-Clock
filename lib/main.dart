import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tix/theme.dart';

import 'package:tix/clock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(Tix());
  });
}

class Tix extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black54,
          title: Text("Tix Clock"),
        ),
        body: Clock(),
      ),
    );
  }
}
