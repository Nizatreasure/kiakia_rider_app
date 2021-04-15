import 'package:flutter/material.dart';
import 'package:kiakia_rider/change_notifier.dart';
import 'package:kiakia_rider/login_signup/current_user_login.dart';
import 'package:kiakia_rider/profile/my_details.dart';
import 'package:kiakia_rider/profile/ride_info.dart';
import 'package:provider/provider.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 200,
          padding: EdgeInsets.only(bottom: 20),
          color: Theme.of(context).buttonColor,
          child: Column(
            children: [
              Spacer(),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/dp.jpeg'),
              ),
              SizedBox(height: 15),
              Text('Undie Ebenezer',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Colors.white)),
              SizedBox(height: 5),
              Text(
                'Rider',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 14, color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          color: Color.fromRGBO(252, 252, 252, 1),
          padding: EdgeInsets.fromLTRB(40, 0, 40, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Update Profile Picture',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 5),
              Text(
                'Your photo helps us know you better',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.black),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Dismiss',
                        style: TextStyle(
                            color: Color.fromRGBO(160, 163, 189, 1),
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Upload',
                        style: TextStyle(
                            color: Theme.of(context).buttonColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Account Settings',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 16)),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyDetails()));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.person_outline),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Your Info',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Edit and view your profile info',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        child: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RideInfo()));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.person_outline),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Delivery Info',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'Edit and view your vehicle and hub info',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 30,
                        child: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () {
                  logoutConfirmation(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(240, 240, 252, 1),
                      borderRadius: BorderRadius.circular(8)),
                  alignment: Alignment.center,
                  height: 60,
                  width: double.infinity,
                  child: Text(
                    'log out'.toUpperCase(),
                    style: TextStyle(
                        color: Theme.of(context).buttonColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  logoutConfirmation(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            content: Text('Do you want to log out?'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('NO')),
              TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CurrentUserLogin()), (route) => false);
                    Provider.of<ChangeBottomNavigationBarIndex>(context,
                            listen: false)
                        .updateCurrentIndex(0);
                  },
                  child: Text('YES')),
            ],
          );
        });
  }
}
