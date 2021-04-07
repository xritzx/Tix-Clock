import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tix/theme.dart';

import 'package:tix/clock.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    runApp(Tix());
  });
}

class Tix extends StatefulWidget {
  Tix({Key key}) : super(key: key);

  @override
  _TixState createState() => _TixState();
}

class _TixState extends State<Tix> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: darkTheme,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black87,
          title: Text("Tix Clock"),
        ),
        body: Clock(),
      ),
    );
  }
}
