import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medjam/modules/login_page.dart';
import 'package:medjam/screens/home_screen.dart';

class Register extends StatefulWidget {
  @override
  SignupPage createState() => SignupPage();
}

class SignupPage extends State<Register> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _fullName = TextEditingController();
  TextEditingController _emailCon = TextEditingController();
  TextEditingController _passwordCon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Form(
              key: _formKey,
              child: Card(
                child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            "Create Account,",
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Sign up to get started!",
                            style: TextStyle(
                                fontSize: 20, color: Colors.grey.shade400),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _fullName,
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Please enter full name";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Full Name",
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: _emailCon,
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Please enter email ID";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: "Email ID",
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: _passwordCon,
                            validator: (String val) {
                              if (val.isEmpty) {
                                return "Please enter password";
                              }
                              return null;
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade400,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            child: OutlineButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _registerAccount();
                                }
                              },
                              padding: EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Ink(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      Color(0xff0277BD),
                                      Color(0xff0277BD),
                                      Color(0xff0277BD),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  constraints: BoxConstraints(
                                      minHeight: 50, maxWidth: double.infinity),
                                  child: Text(
                                    "Sign up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "I'm already a member.",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return SignIn();
                                }));
                              },
                              child: Text(
                                "Sign in.",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ));
  }

  void _registerAccount() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
            email: _emailCon.text, password: _passwordCon.text))
        .user;

    if (user != null) {
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      await user.updateProfile(displayName: _fullName.text);
      final user1 = _auth.currentUser;
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return HomeScreen(
          user: user1,
        );
      }));
    }
  }
}
