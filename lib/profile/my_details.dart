import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kiakia_rider/login_signup/decoration.dart';

class MyDetails extends StatefulWidget {
  @override
  _MyDetailsState createState() => _MyDetailsState();
}

class _MyDetailsState extends State<MyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: InkWell(
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
            ),
            SizedBox(height: 20),
            Text('My Details',
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 20),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Full Name',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: decoration.copyWith(
                        hintText: 'Undie Ebenezer',
                        hintStyle: decoration.hintStyle
                            .copyWith(color: Theme.of(context).textTheme.bodyText2.color, fontWeight: FontWeight.w300, fontSize: 14)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Phone Number',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: decoration.copyWith(
                        hintText: '+2348024128943',
                        hintStyle: decoration.hintStyle
                            .copyWith(color: Theme.of(context).textTheme.bodyText2.color, fontWeight: FontWeight.w300, fontSize: 14)),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Email address',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 14),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: decoration.copyWith(
                        hintText: 'ebenezerundie@gmail.com',
                        hintStyle: decoration.hintStyle
                            .copyWith(color: Theme.of(context).textTheme.bodyText2.color, fontWeight: FontWeight.w300, fontSize: 14)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Text('done'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
