import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kiakia_rider/home/new_cylinder_details.dart';
import 'package:kiakia_rider/login_signup/decoration.dart';

class DeliveryOption extends StatefulWidget {
  final int step;
  DeliveryOption(this.step);
  @override
  _DeliveryOptionState createState() => _DeliveryOptionState();
}

class _DeliveryOptionState extends State<DeliveryOption> {
  bool deactivateButtons = false;

  void deactivateAllButtons(value) {
    setState(() {
      deactivateButtons = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: deactivateButtons ? Color(0xffe5e5e5) : Colors.white,
      body: GestureDetector(
        onTap: deactivateButtons
            ? () {
                Navigator.pop(context);
              }
            : null,
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, viewport) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: viewport.maxHeight),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
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
                          SizedBox(height: 20),
                          Text(widget.step == 1 ?
                            'Step 1 of 2': 'Step 2 of 2',
                            style: TextStyle(
                                color: Color.fromRGBO(24, 54, 108, 1),
                                fontWeight: FontWeight.w400,
                                fontSize: 12),
                          ),
                          SizedBox(height: 5),
                          Text(widget.step == 1 ?
                            'Scan user\'s cylinder': 'Scan your cylinder',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    fontSize: 24, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10),
                          LinearProgressIndicator(
                            value: widget.step == 1 ? 0.5 : 1,
                            backgroundColor: Color.fromRGBO(241, 241, 241, 1),
                            valueColor: AlwaysStoppedAnimation(
                                Color.fromRGBO(24, 54, 108, 1)),
                            minHeight: 2,
                          ),
                          SizedBox(height: 30),
                          if (widget.step == 1)Text(
                            'Existing Gas360 customer?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: deactivateButtons
                                ? () {
                                    Navigator.pop(context);
                                  }
                                : () {},
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(214, 216, 231, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              height: 70,
                              child: Row(
                                children: [
                                  Icon(Icons.camera_alt_outlined),
                                  SizedBox(width: 10),
                                  Text(
                                    'Scan QRcode',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Spacer(),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                'or',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                              )),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: deactivateButtons
                                ? () {
                                    Navigator.pop(context);
                                  }
                                : () {
                                    var bottomSheetController = showBottomSheet(
                                        context: context,
                                        builder: (context) =>
                                            enterCylinderNumber());
                                    deactivateAllButtons(true);

                                    bottomSheetController.closed.then(
                                        (value) => deactivateAllButtons(false));
                                  },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(214, 216, 231, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              height: 70,
                              child: Row(
                                children: [
                                  Icon(Icons.credit_card),
                                  SizedBox(width: 10),
                                  Text(
                                    'Enter cylinder number',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Spacer(),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            ),
                          ),
                         if (widget.step == 1) SizedBox(height: 40),
                          if (widget.step == 1) Text(
                            'New Gas360 customer?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(fontSize: 16),
                          ),
                          if (widget.step == 1) SizedBox(height: 10),
                          if (widget.step == 1) InkWell(
                            onTap: deactivateButtons
                                ? () {
                                    Navigator.pop(context);
                                  }
                                : () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => NewCylinderDetails()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromRGBO(214, 216, 231, 1),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(8)),
                              height: 70,
                              child: Row(
                                children: [
                                  Icon(Icons.credit_card_outlined),
                                  SizedBox(width: 10),
                                  Text(
                                    'Get cylinder specs',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Spacer(),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
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

  enterCylinderNumber() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
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
            SizedBox(height: 15),
            Text('Enter cylinder number',
                style: Theme.of(context).textTheme.bodyText2),
            SizedBox(height: 20),
            Form(
              child: TextFormField(
                decoration: decoration.copyWith(
                    hintText: 'Cylinder serial number',
                    hintStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Color.fromRGBO(161, 164, 178, 1))),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {

              },
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).buttonColor,
                    borderRadius: BorderRadius.circular(4)),
                alignment: Alignment.center,
                width: double.infinity,
                height: 50,
                child: Text('continue'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
