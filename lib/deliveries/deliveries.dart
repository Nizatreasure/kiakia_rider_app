import 'package:flutter/material.dart';
import 'package:kiakia_rider/home/awating_deliveries.dart';

class Deliveries extends StatefulWidget {
  @override
  _DeliveriesState createState() => _DeliveriesState();
}

class _DeliveriesState extends State<Deliveries> {
  List<DeliveryDetails> deliveryList = [
    DeliveryDetails(
        size: '3',
        location: 'Hanifah Phase II, Gidan Kwano, Minna, Niger State',
        name: 'Undie Ebenezer',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '6',
        location: 'Hanifah Phase I, Gidan Kwano, Minna',
        name: 'Ahiaba Daniel',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '9',
        location: 'Pink Lodge, Gidan Kwano, Minna',
        name: 'Udah Paul',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '12',
        location: 'Emerald Lodge, Gidan Kwano, Minna',
        name: 'Ukatane Isaac',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '3',
        location: 'Hanifah Phase II, Gidan Kwano, Minna, Niger State',
        name: 'Undie Ebenezer',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '6',
        location: 'Hanifah Phase I, Gidan Kwano, Minna',
        name: 'Ahiaba Daniel',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '9',
        location: 'Pink Lodge, Gidan Kwano, Minna',
        name: 'Udah Paul',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '12',
        location: 'Emerald Lodge, Gidan Kwano, Minna',
        name: 'Ukatane Isaac',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '3',
        location: 'Hanifah Phase II, Gidan Kwano, Minna, Niger State',
        name: 'Undie Ebenezer',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '6',
        location: 'Hanifah Phase I, Gidan Kwano, Minna',
        name: 'Ahiaba Daniel',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '9',
        location: 'Pink Lodge, Gidan Kwano, Minna',
        name: 'Udah Paul',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '12',
        location: 'Emerald Lodge, Gidan Kwano, Minna',
        name: 'Ukatane Isaac',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '3',
        location: 'Hanifah Phase II, Gidan Kwano, Minna, Niger State',
        name: 'Undie Ebenezer',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '6',
        location: 'Hanifah Phase I, Gidan Kwano, Minna',
        name: 'Ahiaba Daniel',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '9',
        location: 'Pink Lodge, Gidan Kwano, Minna',
        name: 'Udah Paul',
        url: 'assets/dp.jpeg'),
    DeliveryDetails(
        size: '12',
        location: 'Emerald Lodge, Gidan Kwano, Minna',
        name: 'Ukatane Isaac',
        url: 'assets/dp.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(20, 50, 20, 20),
      children: [
        Text('Deliveries', style: Theme.of(context).textTheme.bodyText2),
        SizedBox(height: 20),
        Text(
          'Today',
          style: TextStyle(
              color: Theme.of(context).buttonColor,
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 15),
        ListView.separated(
            itemCount: 12,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  decoration: BoxDecoration(
                      border: index != 4 && index != 11
                          ? BorderDirectional(
                              bottom: BorderSide(
                                  color: Color.fromRGBO(214, 216, 231, 1),
                                  width: 1))
                          : null),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: AssetImage(deliveryList[index].url),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                deliveryList[index].name,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300),
                              ),
                              SizedBox(height: 2),
                              Text(
                                deliveryList[index].location,
                                style: TextStyle(
                                    color: Color.fromRGBO(37, 48, 67, 1),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        child: Text(
                          '${deliveryList[index].size}kg',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      ),
                      Container(
                        width: 30,
                        child: Icon(Icons.keyboard_arrow_right),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return index == 4
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Yesterday',
                          style: TextStyle(
                              color: Theme.of(context).buttonColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 5),
                      ],
                    )
                  : Container();
            })
      ],
    );
  }
}
