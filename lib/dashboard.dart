import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kiakia_rider/change_notifier.dart';
import 'package:kiakia_rider/deliveries/deliveries.dart';
import 'package:kiakia_rider/home/awating_deliveries.dart';
import 'package:kiakia_rider/profile/profile_settings.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    List bottomNavigationBarContents = [AwaitingDeliveries(), Deliveries(), ProfileSettings()];
    int currentIndex = Provider.of<ChangeBottomNavigationBarIndex>(context).currentIndex;
    return Scaffold(
      body: SafeArea(
        child: bottomNavigationBarContents[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                size: 30,
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Icon(
                  FontAwesomeIcons.paperPlane,
                  size: 23,
                ),
              ),
              label: 'Deliveries'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 30,
              ),
              label: 'Profile'),
        ],
        unselectedItemColor: Color.fromRGBO(161, 163, 189, 1),
        selectedItemColor: Color.fromRGBO(49, 109, 216, 1),
        backgroundColor: Color.fromRGBO(252, 252, 252, 1),
        selectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        unselectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
        currentIndex: currentIndex,
        onTap: (index) {
          Provider.of<ChangeBottomNavigationBarIndex>(context,listen: false).updateCurrentIndex(index);
        },
      ),
    );
  }
}
