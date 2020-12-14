import 'package:flutter/material.dart';
import 'package:medjam/constant.dart';

class ChooseDate extends StatefulWidget {
  final String week;
  final String date;
  //final bool check;

  const ChooseDate({
    Key key,
    this.week,
    this.date,
    //this.check = false,
  }) : super(key: key);

  @override
  _ChooseDateState createState() => _ChooseDateState();
}

bool check = false;

class _ChooseDateState extends State<ChooseDate> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          widget.week,
          style: TextStyle(
            color: kTitleTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              check = !check;
            });
          },
          child: Container(
            width: 48,
            height: 48,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: check ? kYellowColor : Colors.transparent,
              border: Border.all(
                  color: check ? kYellowColor : kTitleTextColor, width: 0.5),
              borderRadius: BorderRadius.circular(36),
            ),
            child: Text(
              widget.date,
              style: TextStyle(
                color: check ? Colors.white : kTitleTextColor,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
