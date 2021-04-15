import 'package:flutter/material.dart';
import 'package:kiakia_rider/dashboard.dart';

class AllSet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacer(flex: 5,),
            Text('You are all set!', style: TextStyle(color: Color.fromRGBO(24,54,108,1), fontWeight: FontWeight.w700, fontSize: 32),),
            SizedBox(height: 8,),
            Text('You can begin enjoying Gas360 experience', style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16),),
            SizedBox(height: 35),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Dashboard()), (route) => false);
              },
              child: Container(
                decoration: BoxDecoration(color: Theme.of(context).buttonColor, borderRadius: BorderRadius.circular(8)),
                alignment: Alignment.center,
                height: 60,
                  width: double.infinity,
                child: Text('Get Started'.toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w400),),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
