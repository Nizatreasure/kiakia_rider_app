import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kiakia_rider/home/delivery_option.dart';
import 'package:kiakia_rider/login_signup/decoration.dart';

class NewCylinderDetails extends StatefulWidget {
  @override
  _NewCylinderDetailsState createState() => _NewCylinderDetailsState();
}

class _NewCylinderDetailsState extends State<NewCylinderDetails> {
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
            Text('New cylinder details',
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 20),
            Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Production year',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: decoration.copyWith(
                        hintText: 'MM/YYYY',
                        hintStyle: decoration.hintStyle
                            .copyWith(color: Color.fromRGBO(161, 164, 178, 1))),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Expiry year',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: decoration.copyWith(
                        hintText: 'MM/YYYY',
                        hintStyle: decoration.hintStyle
                            .copyWith(color: Color.fromRGBO(161, 164, 178, 1))),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Country of production',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    decoration: decoration.copyWith(
                        hintText: 'Thailand',
                        hintStyle: decoration.hintStyle
                            .copyWith(color: Color.fromRGBO(48, 109, 216, 1))),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            InkWell(
              onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryOption(2)));},
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(4)),
                child: Text('continue'.toUpperCase(),
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
