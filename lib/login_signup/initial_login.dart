import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kiakia_rider/dashboard.dart';
import 'package:kiakia_rider/login_signup/decoration.dart';
import 'package:kiakia_rider/login_signup/signup.dart';

class InitialLogin extends StatefulWidget {
  final bool showButton;
  InitialLogin(this.showButton);

  @override
  _InitialLoginState createState() => _InitialLoginState();
}

class _InitialLoginState extends State<InitialLogin> {
  TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _handleTap;
    super.initState();
  }

  void _handleTap() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SignUp(false)));
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(child: LayoutBuilder(builder: (context, viewport) {
      return SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: viewport.maxHeight),
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  if (widget.showButton)
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(239, 240, 246, 1)),
                        padding: EdgeInsets.all(5),
                        height: 32,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(pi),
                          child: Icon(
                            Icons.arrow_right_alt,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(height: 20),
                  Text('Welcome Back!',
                      style: Theme.of(context).textTheme.bodyText2),
                  SizedBox(height: 5),
                  Text(
                    'Log in with your details to access your account',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontSize: 12),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: decoration.copyWith(
                              hintText: 'Phone number',
                              hintStyle: decoration.hintStyle.copyWith(
                                  color: Color.fromRGBO(161, 164, 178, 1))),
                        ),
                        SizedBox(height: 15),
                        TextFormField(
                          decoration: decoration.copyWith(
                              hintText: 'Password',
                              hintStyle: decoration.hintStyle.copyWith(
                                color: Color.fromRGBO(161, 164, 178, 1),
                              ),
                              suffixIcon: Icon(
                                Icons.remove_red_eye_outlined,
                                color: Colors.black54,
                              )),
                        ),
                        SizedBox(height: 15),
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              child: Text(
                                'Forgot Password?',
                                style: TextStyle(
                                    color: Color.fromRGBO(48, 109, 216, 1),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        InkWell(
                          onTap: () {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
                          },
                          child: Container(
                            height: 55,
                            width: double.infinity,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text('Log in'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14)),
                          ),
                        ),
                        SizedBox(height: 50),
                        RichText(
                            text: TextSpan(
                                style: Theme.of(context).textTheme.bodyText1,
                                children: [
                              TextSpan(text: 'Not a member? '),
                              TextSpan(
                                text: 'Create an account',
                                style: TextStyle(color: Colors.blue),
                                recognizer: _tapGestureRecognizer,
                              ),
                            ]))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    })));
  }
}
