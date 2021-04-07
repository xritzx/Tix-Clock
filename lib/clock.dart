import 'package:flutter/material.dart';
import 'package:tix/cubes.dart';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Cube(),
                Cube(),
                Cube(),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Cube(),
                  Cube(),
                  Cube(),
                ]),
                Row(children: [
                  Cube(),
                  Cube(),
                  Cube(),
                ]),
                Row(children: [
                  Cube(),
                  Cube(),
                  Cube(),
                ]),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Cube(),
                  Cube(),
                  Cube(),
                ]),
                Row(children: [
                  Cube(),
                  Cube(),
                  Cube(),
                ]),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Cube(),
                  Cube(),
                  Cube(),
                ]),
                Row(children: [
                  Cube(),
                  Cube(),
                  Cube(),
                ]),
                Row(children: [
                  Cube(),
                  Cube(),
                  Cube(),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
