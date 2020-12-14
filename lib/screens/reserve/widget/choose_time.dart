import 'package:flutter/material.dart';
import 'package:medjam/constant.dart';

class ChooseTime extends StatefulWidget {
  final String time;
  //final bool check;

  const ChooseTime({
    Key key,
    this.time,
    //this.check = false,
  }) : super(key: key);

  @override
  _ChooseTimeState createState() => _ChooseTimeState();
}

bool check = false;

class _ChooseTimeState extends State<ChooseTime> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          check = !check;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: check ? kYellowColor : Colors.transparent,
          border: Border.all(
              color: check ? kYellowColor : kTitleTextColor, width: 0.5),
          borderRadius: BorderRadius.circular(36),
        ),
        child: Text(
          widget.time,
          style: TextStyle(
              fontSize: 12, color: check ? Colors.white : kTitleTextColor),
        ),
      ),
    );
  }
}
