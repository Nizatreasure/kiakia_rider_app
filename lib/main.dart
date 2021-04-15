import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text/model.dart';
import 'package:flutter_circular_text/circular_text/widget.dart';
import 'package:kiakia_rider/change_notifier.dart';
import 'package:kiakia_rider/login_signup/get_started.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int start = 5;
  Timer _timer;

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ChangeBottomNavigationBarIndex>(
          create: (context) => ChangeBottomNavigationBarIndex(),
        )
      ],
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            currentFocus.focusedChild.unfocus();
          }
        },
        child: MaterialApp(
          home: Consumer<ChangeBottomNavigationBarIndex>(
            builder: (context, appState, child) {
              return child;
            },
            child: start == 0 ? GetStarted() : StartPage(),
            // child: Dashboard(),
          ),
          theme: lightTheme,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  height: 90,
                  child: Image.asset('assets/logo.png')),
            ),
            Positioned(
              bottom: -100,
              left: (MediaQuery.of(context).size.width - 200) / 2,
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
    );
  }
}

ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    buttonColor: Color.fromRGBO(48, 109, 216, 1),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Color.fromRGBO(37, 48, 67, 1),
          fontWeight: FontWeight.w300,
          fontSize: 14),
      bodyText2: TextStyle(
          color: Color.fromRGBO(24, 54, 108, 1),
          fontWeight: FontWeight.w500,
          fontSize: 24),
      button: TextStyle(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    splashColor: Colors.transparent);
