import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kiakia_rider/login_signup/all_set.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyNumber extends StatefulWidget {
  final String number;
  VerifyNumber(this.number);
  @override
  _VerifyNumberState createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  Timer _timer;
  int _start = 80;
  String otp = '', error = '';
  bool validated = false, showLoader = false, showError = false;
  final _formKey = GlobalKey<FormState>();

  void startTimer() {
    const time = const Duration(seconds: 1);
    _timer = new Timer.periodic(time, (timer) {
      setState(() {
        if (_start < 1)
          timer.cancel();
        else
          _start = _start - 1;
      });
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width > 500
        ? 500
        : MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: LayoutBuilder(
            builder: (context, viewPort) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: viewPort.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
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
                        SizedBox(height: 30),
                        Text('Verify your number',
                            style: Theme.of(context).textTheme.bodyText2),
                        SizedBox(height: 10),
                        Text(
                            'Waiting to automatically detect an SMS sent to ${widget.number} or you can manually enter the OTP',
                            style: Theme.of(context).textTheme.bodyText1),
                        SizedBox(height: 30),
                        Container(
                          child: Form(
                            key: _formKey,
                            child: PinCodeTextField(
                              appContext: context,
                              length: 6,
                              onChanged: (val) {
                                otp = val;
                                setState(() {
                                  if (val.length >= 4)
                                    validated = true;
                                  else
                                    validated = false;
                                });
                                if (otp.length == 6) {
                                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                                      builder: (context) => AllSet()), (route) => false);
                                }
                              },
                              validator: (val) {
                                return val.length < 4 ? '' : null;
                              },
                              cursorColor: Colors.black,
                              textStyle: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              enableActiveFill: true,
                              animationType: AnimationType.none,
                              backgroundColor: Colors.transparent,
                              keyboardType: TextInputType.number,
                              showCursor: false,
                              pinTheme: PinTheme(
                                  borderRadius: BorderRadius.circular(8),
                                  fieldWidth: (width - 84) / 6,
                                  fieldHeight: (width - 84) / 6,
                                  shape: PinCodeFieldShape.box,
                                  inactiveFillColor:
                                      Color.fromRGBO(239, 240, 246, 1),
                                  activeFillColor:
                                      Color.fromRGBO(24, 54, 108, 1),
                                  activeColor: Colors.transparent,
                                  inactiveColor: Colors.transparent,
                                  selectedFillColor:
                                      Color.fromRGBO(24, 54, 108, 1),
                                  selectedColor: Colors.transparent),
                            ),
                          ),
                        ),
                        SizedBox(height: showError ? 15 : 30),
                        if (showError)
                          Container(
                            height: 30,
                            alignment: Alignment.topCenter,
                            child: Text(
                              error,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Didn\'t get code?',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xff515352),
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: _timer.isActive
                                  ? null
                                  : () async {
                                      setState(() {
                                        _start = 80;
                                        startTimer();
                                      });
                                    },
                              child: Container(
                                child: _timer.isActive
                                    ? Text(
                                        _start > 69
                                            ? 'Resend code in 01:${_start - 60}'
                                            : _start > 59
                                                ? 'Resend code in 01:0${_start - 60}'
                                                : _start > 10
                                                    ? 'Resend code in 00:$_start'
                                                    : 'Resend code in 00:0$_start',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blue[200],
                                            fontWeight: FontWeight.w500),
                                      )
                                    : Text(
                                        'Resend Code',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.blue,
                                            fontWeight: FontWeight.w500),
                                      ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        // InkWell(
                        //   child: Container(
                        //     decoration: BoxDecoration(color: Theme.of(context).buttonColor, borderRadius: BorderRadius.circular(8)),
                        //     alignment: Alignment.center,
                        //     width: double.infinity,
                        //     height: 60,
                        //     child: Text('Verify'.toUpperCase(),
                        //         style: TextStyle(
                        //           color: Colors.white,
                        //             fontSize: 16,
                        //             fontWeight: FontWeight.w500)),
                        //   ),
                        //
                        // ),

                        Spacer(
                          flex: 4,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
