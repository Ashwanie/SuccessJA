import 'package:medjam/constant.dart';
import 'package:medjam/modules/doctor_login.dart';
import 'package:medjam/modules/signup_page.dart';

import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/onboarding_illustration.png',
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 6,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Welcome to MedJA',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: kTitleTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Register(),
                          ),
                        );
                      },
                      color: kOrangeColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Patient Login',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DocSignIn(),
                          ),
                        );
                      },
                      color: kOrangeColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 30,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'Doctor Login',
                        style: TextStyle(
                          color: kWhiteColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
