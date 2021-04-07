import 'package:flutter/material.dart';

class Cube extends StatefulWidget {
  Cube({Key key}) : super(key: key);

  @override
  _CubeState createState() => _CubeState();
}

class _CubeState extends State<Cube> {
  var isSelected = false;
  var color = Colors.red;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected)
            isSelected = false;
          else
            isSelected = true;
          color = isSelected ? Colors.blue : Colors.red;
        });
      },
      child: SizedBox(
        width: 60,
        height: 60,
        child: Container(
          margin: EdgeInsets.all(5),
          color: color,
        ),
      ),
    );
  }
}
