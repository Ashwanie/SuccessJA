import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medjam/DocHome.dart';
import 'package:medjam/modules/signup_page.dart';
import 'package:medjam/screens/home_screen.dart';

class DocSignIn extends StatefulWidget {
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<DocSignIn> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Form(
        key: _formKey,
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
                    "Welcome,",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    "Sign in to continue!",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade400),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  TextFormField(
                    controller: _emailController,
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "Please enter Email ID";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Email ID",
                      labelStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle:
                          TextStyle(fontSize: 14, color: Colors.grey.shade400),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.red,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "Forgot Password ?",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    child: OutlineButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          _signInWithEmailPassword();
                        }
                      },
                      padding: EdgeInsets.all(0),
                      child: Ink(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff0277BD),
                              Color(0xff0277BD),
                              Color(0xff0277BD),
                            ],
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                              maxWidth: double.infinity, minHeight: 50),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void _signInWithEmailPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text))
          .user;
      if (!user.emailVerified) {
        await user.sendEmailVerification();
      }
      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        return DocHomePage(
          user: user,
        );
      }));
    } catch (e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Failed to sign in with email and password"),
      ));
      print(e);
    }
  }
}
