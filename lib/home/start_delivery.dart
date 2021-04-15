import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kiakia_rider/home/awating_deliveries.dart';
import 'package:kiakia_rider/home/delivery_option.dart';

class StartDelivery extends StatefulWidget {
  final DeliveryDetails details;
  final String deliveryType;
  StartDelivery({@required this.details, this.deliveryType});
  @override
  _StartDeliveryState createState() => _StartDeliveryState();
}

class _StartDeliveryState extends State<StartDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.blueGrey,
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  color: Colors.white,
                ),
                padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Cylinder Size'.toUpperCase(),
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        Text(
                          'Distance'.toUpperCase(),
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              fontSize: 12, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${widget.details.size}KG',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 16),
                        ),
                        Spacer(),
                        Text(
                          '10mins away',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                    Divider(
                        color: Color.fromRGBO(214, 216, 231, 1), height: 15),
                    Container(
                      constraints: BoxConstraints(minHeight: 30),
                      child: Row(
                        children: [
                          Icon(widget.deliveryType == 'start' ? Icons.person_outline : Icons.location_on_outlined,
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              size: 20),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(widget.deliveryType == 'start' ?
                              widget.details.name : widget.details.location,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                          if (widget.deliveryType == 'start') SizedBox(width: 10),
                          if (widget.deliveryType == 'start') IconButton(
                              icon: Icon(Icons.call),
                              onPressed: () {},
                              color: Theme.of(context).buttonColor),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                    Divider(
                        color: Color.fromRGBO(214, 216, 231, 1), height: 15),
                    Container(
                      constraints: BoxConstraints(minHeight: 30),
                      child: Row(
                        children: [
                          Icon(widget.deliveryType == 'start' ? Icons.location_on_outlined : Icons.credit_card_outlined,
                              color:
                                  Theme.of(context).textTheme.bodyText1.color,
                              size: 20),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(widget.deliveryType == 'start' ?
                              widget.details.location : 'Pay on delivery',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(fontSize: 16),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DeliveryOption(1)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).buttonColor,
                            borderRadius: BorderRadius.circular(4)),
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 50,
                        child: Text(widget.deliveryType == 'start' ? 'Start delivery'.toUpperCase() : 'end delivery'.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 20,
              left: 20,
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
            )
          ],
        ),
      ),
    );
  }
}
