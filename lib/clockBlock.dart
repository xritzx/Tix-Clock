import 'package:flutter/material.dart';
import 'package:tix/cubes.dart';

class ClockBlock extends StatelessWidget {
  const ClockBlock({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Cube(0),
            Cube(1),
            Cube(2),
          ],
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Cube(3),
              Cube(4),
              Cube(5),
            ]),
            Row(children: [
              Cube(6),
              Cube(7),
              Cube(8),
            ]),
            Row(children: [
              Cube(9),
              Cube(10),
              Cube(11),
            ]),
          ],
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Cube(12),
              Cube(15),
            ]),
            Row(children: [
              Cube(13),
              Cube(16),
            ]),
            Row(children: [
              Cube(14),
              Cube(17),
            ]),
          ],
        ),
        Spacer(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              Cube(18),
              Cube(19),
              Cube(20),
            ]),
            Row(children: [
              Cube(21),
              Cube(22),
              Cube(23),
            ]),
            Row(children: [
              Cube(24),
              Cube(25),
              Cube(26),
            ]),
          ],
        ),
        Spacer(),
      ],
    );
  }
}
