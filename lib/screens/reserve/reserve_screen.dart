import 'package:flutter/material.dart';
import 'package:medjam/constant.dart';
import 'package:medjam/model/choose_model.dart';
import 'package:medjam/screens/home_screen.dart';
import 'package:medjam/screens/reserve/widget/choose_date.dart';
import 'package:medjam/screens/reserve/widget/choose_time_group.dart';
import 'package:medjam/screens/reserve/widget/my_appbar.dart';
import 'package:medjam/screens/reserve/widget/user_info.dart';
import 'package:medjam/screens/reserve/my_header.dart';

class ReserveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          MyHeader(
            height: 258,
            imageUrl: 'assets/images/avatar_head.png',
            child: Column(
              children: <Widget>[
                MyAppbar(),
                SizedBox(
                  height: 16,
                ),
                UserInfo(),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [kBackgroundColor, kBackgroundColor],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  ChooseSlot(),
                  SizedBox(
                    height: 32,
                  ),
                  ChooseTimeGroup(
                    title: 'Morning',
                    list: [
                      ChooseModel('09.00 AM'),
                      ChooseModel('09.30 AM'),
                      ChooseModel('10.30 AM'),
                      ChooseModel('11.00 AM'),
                      ChooseModel('11.30 AM'),
                      ChooseModel('12.00 AM'),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  ChooseTimeGroup(
                    title: 'Afternoon',
                    list: [
                      ChooseModel('02.00 PM'),
                      ChooseModel('02.30 PM'),
                      ChooseModel('03.00 PM'),
                      ChooseModel('03.30 PM'),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  ChooseTimeGroup(
                    title: 'Evening',
                    list: [
                      ChooseModel('06.00 PM'),
                      ChooseModel('06.30 PM'),
                      ChooseModel('07.00 PM'),
                      ChooseModel('07.30 PM'),
                      ChooseModel('08.00 PM'),
                      ChooseModel('08.30 PM'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                          title: Text('YOU ARE ALL SET!'),
                          content: Text(
                              'Please check your email Kaiyemorrison@yahoo.com for confirmation.'),
                          elevation: 24.0,
                          actions: [
                            FlatButton(
                              child: Text('Done'),
                              onPressed: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                    ((Route<dynamic> route) => false));
                              },
                            ),
                          ]));
            },
            color: kOrangeColor,
            padding: EdgeInsets.symmetric(
              horizontal: 30,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Set Appointment',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ChooseSlot extends StatelessWidget {
  const ChooseSlot({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Choose Your Slot',
          style: TextStyle(
            color: kTitleTextColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            ChooseDate(
              week: 'Monday',
              date: '21',
            ),
            ChooseDate(
              week: 'Tuesday',
              date: '22',
            ),
            ChooseDate(
              week: 'Wednesday',
              date: '23',
            ),
            ChooseDate(
              week: 'Thursday',
              date: '24',
            ),
            ChooseDate(
              week: 'Friday',
              date: '25',
            ),
            ChooseDate(
              week: 'Saturday',
              date: '26',
            ),
          ],
        )
      ],
    );
  }
}
