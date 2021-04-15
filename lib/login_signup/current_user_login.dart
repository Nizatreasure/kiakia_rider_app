import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kiakia_rider/dashboard.dart';
import 'package:kiakia_rider/login_signup/decoration.dart';
import 'package:kiakia_rider/login_signup/initial_login.dart';

class CurrentUserLogin extends StatefulWidget {
  @override
  _CurrentUserLoginState createState() => _CurrentUserLoginState();
}

class _CurrentUserLoginState extends State<CurrentUserLogin> {
  TapGestureRecognizer _tapGestureRecognizer;

  @override
  void initState() {
    _tapGestureRecognizer = TapGestureRecognizer()..onTap = _handleTap;
    super.initState();
  }

  void _handleTap() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => InitialLogin(false)));
  }

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, viewport) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: viewport.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 50),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                            height: 90,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text('Welcome back, Niza',
                            style: Theme.of(context).textTheme.bodyText2),
                        SizedBox(height: 30),
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
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Dashboard()),
                                (route) => false);
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
                              TextSpan(text: 'Not you? '),
                              TextSpan(
                                text: 'Switch account',
                                style: TextStyle(color: Colors.blue),
                                recognizer: _tapGestureRecognizer,
                              ),
                            ]))
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
