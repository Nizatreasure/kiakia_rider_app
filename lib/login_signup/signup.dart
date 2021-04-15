import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:kiakia_rider/login_signup/decoration.dart';
import 'package:kiakia_rider/login_signup/initial_login.dart';
import 'package:kiakia_rider/login_signup/verify_number.dart';

class SignUp extends StatefulWidget {
  final bool showButton;
  SignUp(this.showButton);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TapGestureRecognizer _tapGestureRecognizer1;
  TapGestureRecognizer _tapGestureRecognizer2;
  TapGestureRecognizer _tapGestureRecognizer3;
  String number;
  List hubs = [
    'Ikoyi',
    'Beggar',
    'Lagos',
    'Ijebu-Ode',
    'Oshodi',
    'Yaba',
    'Ikeja'
  ];
  String selected;

  @override
  void initState() {
    _tapGestureRecognizer1 = TapGestureRecognizer()..onTap = _handleTap1;
    _tapGestureRecognizer2 = TapGestureRecognizer()..onTap = _handleTap2;
    _tapGestureRecognizer3 = TapGestureRecognizer()..onTap = _handleTap3;
    super.initState();
  }

  @override
  void dispose() {
    _tapGestureRecognizer1.dispose();
    _tapGestureRecognizer2.dispose();
    _tapGestureRecognizer3.dispose();
    super.dispose();
  }

  void _handleTap1() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Scaffold()));
  }

  void _handleTap2() {}
  void _handleTap3() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => InitialLogin(false)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, viewport) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: viewport.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20, 20, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      Text(
                        'Personal Information',
                        style: TextStyle(
                            color: Color.fromRGBO(24, 54, 108, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 24),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Let\'s get to know you better',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontSize: 12),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text('First Name',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text('Last Name',
                                style: Theme.of(context).textTheme.bodyText1),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textCapitalization: TextCapitalization.words,
                                  decoration:
                                      decoration.copyWith(hintText: 'John'),
                                )),
                                SizedBox(width: 20),
                                Expanded(
                                    child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  textCapitalization: TextCapitalization.words,
                                  decoration:
                                      decoration.copyWith(hintText: 'Doe'),
                                ))
                              ],
                            ),
                            SizedBox(height: 20),
                            Text('Phone Number',
                                style: Theme.of(context).textTheme.bodyText1),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Container(
                                    width: 60,
                                    child: TextFormField(
                                      decoration: decoration.copyWith(
                                          hintText: '+234',
                                          hintStyle: Theme.of(context)
                                              .textTheme
                                              .bodyText1),
                                      style: TextStyle(color: Colors.black),
                                      readOnly: true,
                                    )),
                                SizedBox(width: 20),
                                Expanded(
                                  flex: 4,
                                  child: TextFormField(
                                    style: TextStyle(
                                      letterSpacing: 2,
                                    ),
                                    decoration: decoration.copyWith(
                                        hintText: '9012345678',
                                        hintStyle: decoration.hintStyle
                                            .copyWith(letterSpacing: 2),
                                        counterText: ''),
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    maxLength: 10,
                                    onChanged: (val) {
                                      number = '0' + val;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Password',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(height: 5),
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
                            SizedBox(height: 20),
                            Text(
                              'Hub Branch',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            SizedBox(height: 5),
                            DropdownButtonFormField(
                              items: hubs.map((hub) {
                                return DropdownMenuItem(
                                  child: Text('$hub'),
                                  value: hub,
                                );
                              }).toList(),
                              value: selected,
                              onChanged: (newValue) {
                                selected = newValue;
                              },
                              decoration: decoration.copyWith(
                                  hintText: 'Please select a hub'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => VerifyNumber(number)));
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Theme.of(context).buttonColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Text('Next'.toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14)),
                        ),
                      ),
                    SizedBox(
                              height: 30,
                            ),
                      RichText(
                        text: TextSpan(
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontWeight: FontWeight.w400),
                            children: [
                              TextSpan(text: 'By continuing, you accept our '),
                              TextSpan(
                                  text: 'Terms and Conditions',
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: _tapGestureRecognizer1),
                              TextSpan(text: ' and '),
                              TextSpan(
                                  text: 'Privacy Policy',
                                  style: TextStyle(color: Colors.blue))
                            ]),
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                            text: TextSpan(
                                style: Theme.of(context).textTheme.bodyText1,
                                children: [
                              TextSpan(text: 'Have an account? '),
                              TextSpan(
                                text: 'Log in',
                                style: TextStyle(color: Colors.blue),
                                recognizer: _tapGestureRecognizer3,
                              ),
                            ])),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
