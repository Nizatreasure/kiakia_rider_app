import 'package:flutter/material.dart';
import 'package:kiakia_rider/home/start_delivery.dart';

class AwaitingDeliveries extends StatefulWidget {
  @override
  _AwaitingDeliveriesState createState() => _AwaitingDeliveriesState();
}

class _AwaitingDeliveriesState extends State<AwaitingDeliveries> {
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
      children: [
        Container(
          height: 130,
          color: Color.fromRGBO(247, 247, 252, 1),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 0, 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Good morning,',
                        style: TextStyle(
                            color: Color.fromRGBO(48, 109, 216, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w300),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Niza',
                        style: TextStyle(
                            color: Color.fromRGBO(48, 109, 216, 1),
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                Container(
                  width: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/dp.jpeg'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            'Awaiting Deliveries',
            style: TextStyle(
                color: Color.fromRGBO(24, 54, 108, 1),
                fontWeight: FontWeight.w500,
                fontSize: 16),
          ),
        ),
        SizedBox(height: 5),
        ListView.builder(
            itemCount: deliveryList.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => StartDelivery(
                                details: deliveryList[index],
                                deliveryType: 'start',
                              )));
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                  decoration: BoxDecoration(
                      border: index != deliveryList.length - 1
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
            }),
      ],
    );
  }
}

class DeliveryDetails {
  String url;
  String name;
  String location;
  String size;

  DeliveryDetails({this.size, this.location, this.name, this.url});
}
