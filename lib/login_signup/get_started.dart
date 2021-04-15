import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import 'package:kiakia_rider/login_signup/initial_login.dart';
import 'package:kiakia_rider/login_signup/signup.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, viewportConstraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: viewportConstraint.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    height < 650 ? Container(height: height/6.5): height < 800? Container(height: height/4,): Spacer(flex: 4),
                    Expanded(
                      flex: height >= 800 ? 7 : 1,
                      child: Stack(
                        children: [
                          Container(
                            constraints: BoxConstraints(minHeight: 500),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 80,
                                  alignment: Alignment.center,
                                  child: Image.asset('assets/logo.png'),
                                  margin: EdgeInsets.only(bottom: 40),
                                ),
                                Center(
                                  child: CircularText(
                                      radius: 100,
                                      position: CircularTextPosition.outside,
                                      children: [
                                        TextItem(
                                          text: Text(
                                            'GAS360 Experience'.toUpperCase(),
                                            style: TextStyle(
                                                fontSize: 21.14,
                                                fontWeight: FontWeight.w400,
                                                color: Color.fromRGBO(214, 216, 231, 1)),
                                          ),
                                          space: 9,
                                          startAngle: -90,
                                          startAngleAlignment: StartAngleAlignment.center,
                                          direction: CircularTextDirection.clockwise,
                                        )
                                      ]),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 200,
                            bottom: 0,
                            child: Container(
                              color: Colors.white,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(30, 50, 30, 30),
                                child: Column(
                                    children: [
                                  Text(
                                    'Earn money delivering gas',
                                    style: TextStyle(
                                        color: Color.fromRGBO(24, 54, 108, 1),
                                        fontWeight: FontWeight.w500,
                                        fontSize: 24),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                      'Order gas from the convenience of your homes and get it delivered to you in record time',
                                      style: TextStyle(
                                          color: Color.fromRGBO(37, 48, 67, 1),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300)),
                                  SizedBox(height: 20),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => InitialLogin(true)));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Color.fromRGBO(247, 247, 252, 1), borderRadius: BorderRadius.circular(8)),
                                      width: double.infinity,
                                      constraints: BoxConstraints(minHeight: 64, maxHeight: 64),
                                      child: Text(
                                        'sign in to existing account'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Theme.of(context).buttonColor),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(true)));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 16),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).buttonColor, borderRadius: BorderRadius.circular(8)),
                                      width: double.infinity,
                                      constraints: BoxConstraints(minHeight: 64, maxHeight: 64),
                                      child: Text(
                                        'get started'.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color.fromRGBO(255,255,255,1)),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
