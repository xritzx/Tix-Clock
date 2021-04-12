import 'package:flutter/material.dart';
import 'package:tix/cubes.dart';

class ClockBlock extends StatelessWidget {
  const ClockBlock({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Cube(0),
                Cube(1),
                Cube(2),
              ]),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Cube(3),
                Cube(4),
                Cube(5),
                Cube(6),
                Cube(7),
                Cube(8),
                Cube(9),
                Cube(10),
                Cube(11),
              ]),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Cube(12),
                Cube(13),
                Cube(14),
                Cube(15),
                Cube(16),
                Cube(17),
              ]),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Cube(18),
                Cube(19),
                Cube(20),
                Cube(21),
                Cube(22),
                Cube(23),
                Cube(24),
                Cube(25),
                Cube(26),
              ]),
        ]);
  }
}
