import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ovcapp/volunteerlog/deliveries/deliveries.dart';
import 'package:ovcapp/themes.dart';
import 'package:ovcapp/volunteerlog/loghours/loghours.dart';
import 'package:ovcapp/volunteerlog/alldelivery/alldelivery.dart';
import 'package:ovcapp/volunteerlog/allpickup/allpickup.dart';
import 'package:ovcapp/volunteerlog/individualdelivery/individualdelivery.dart';
import 'package:ovcapp/volunteerlog/individualpickup/individualpickup.dart';
import 'package:ovcapp/volunteerlog/pickups/pickups.dart';
import 'package:ovcapp/assets/ovcicons.dart';
import 'package:ovcapp/volunteerlog/food/food.dart';
import 'package:ovcapp/volunteerlog/volunteer/volunteer.dart';

int count = 0;

volunteerLogTester(BuildContext context, Volunteer person) //add pickup and delivery objects to display on log screen
{
  if(count == 0) //counter is used so objects don't duplicate
    {
      //initialize these objects to view pickups, deliveries on screen, they are dummy objects, send actual pickups/deliveries for a volunteer here.
      Food bread = new Food("Bread", "Juan Mora", "123 My House Ct.", 2.0, true, 2);
      Deliveries bread1 = new Deliveries(bread, "03-12-2021", person, context);
      Food bread2 = new Food("Bread", "Juan Mora", "123 My House Ct.", 2.0, false, 2);
      Pickups bread3 = new Pickups(bread2, "03-12-2021", person);
      Food lasagna = new Food("Lasagna", "Juan Mora", "123 My House Ct.", 2.0, false, 2);
      Pickups lasagna1 = new Pickups(lasagna, "03-13-2021", person);
      Food salad = new Food("Salad", "Juan Mora", "123 My House Ct.", 2.0, true, 2);
      Deliveries salad1 = new Deliveries(salad, "03-10-2021", person, context);
      Food pasta = new Food("Pasta", "Juan Mora", "123 My House Ct.", 2.0, true, 2);
      Pickups pasta1 = new Pickups(pasta, "03-15-2021", person);
      Food lasagna2 = new Food("Lasagna", "Juan Mora", "123 My House Ct.", 2.0, false, 2);
      Deliveries lasagna3 = new Deliveries(lasagna2, "03-14-2021", person, context);
      Food pasta2 = new Food("Pasta", "Juan Mora", "123 My House Ct.", 2.0, true, 2);
      Deliveries pasta3 = new Deliveries(pasta2, "03-11-2021", person, context);
      count++;
    }

}

class VolunteerLog extends StatefulWidget {
  const VolunteerLog({Key? key}) : super(key: key);
  @override
  _VolunteerLogState createState() => _VolunteerLogState();
}

class _VolunteerLogState extends State<VolunteerLog> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: CustomTheme.getLight() ? CustomTheme.getLightTheme() : CustomTheme.getDarkTheme(),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: CustomTheme.getLight() ? Colors.white : Colors.black,
          appBar: AppBar(
            leading: GestureDetector(
              onTap: () {}, //place profile page here
              child: Icon(
                OVCIcons.profileicon, size: 30.0,
              ),
            ),
            title: Text('Onyxx Village Connection', style: TextStyle(fontFamily: "BigShouldersDisplay", fontWeight: FontWeight.w500, fontSize: 25, ),),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: Container(
            child: body(context),
          ),
        ),
      ),
    );
  }
}

listItems(BuildContext context, String type, Volunteer volunteer){
  Widget returning = new Container();
  List<Pickups> listPickups = Pickups.pickups;
  List<Deliveries> listDeliver = Deliveries.deliveries;
  if(type == "pickup")
    {
      if(listPickups.length >= 3)
      {
        returning = ListBody(
          children: [
            organize(context, 1, "cart", "pickup", volunteer),
            organize(context, 2, "cart", "pickup", volunteer),
            organize(context, 3, "cart", "pickup", volunteer),
          ],
        );
      }
      if(listPickups.length == 0){
        returning = Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              child: Icon(OVCIcons.pickupicon, color: Color(0xFFE0CB8F), size: 34,), ),
            Expanded(
              child: Container(padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                  child: TextButton(onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllPickup(volunteer: volunteer,)),);},
                    style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered))
                            return Color(0xFFE0CB8F);
                          return Color(0xFFE0CB8F); // Defer to the widget's default.
                        }), shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(color: Color(0xFFE0CB8F), width: 2)), ),
                      padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),),
                    child: ListBody(children: [
                      Text("You have 0 previous pickups", style: TextStyle(fontSize: 18, color: CustomTheme.getLight() ? Colors.black : Colors.white)),],//_LogHoursState._total.toString()
                    ),
                  )
              ),
            ),
          ],
        );
      }
      if(listPickups.length >= 3)
      {
        returning = ListBody(
          children: [
            organize(context, 1, "cart", "pickup", volunteer),
            organize(context, 2, "cart", "pickup", volunteer),
            organize(context, 3, "cart", "pickup", volunteer),
          ],
        );
      }
      if(listPickups.length == 2)
      {
        returning = ListBody(
          children: [
            organize(context, 1, "cart", "pickup", volunteer),
            organize(context, 2, "cart", "pickup", volunteer),
          ],
        );
      }
      if(listPickups.length == 1)
      {
        returning = ListBody(
          children: [
            organize(context, 1, "cart", "pickup", volunteer),
          ],
        );
      }
    }
  if(type == "delivery")
  {
    if(listDeliver.length == 0){
      returning = Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.airport_shuttle_rounded, color: Color(0xFFE0CB8F), size: 34,), ),
          Expanded(
            child: Container(padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                child: TextButton(onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllDelivery(volunteer: volunteer,)),);},
                  style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Color(0xFFE0CB8F);
                        return Color(0xFFE0CB8F); // Defer to the widget's default.
                      }), shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFFE0CB8F), width: 2)), ),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),),
                  child: ListBody(children: [
                    Text("You have 0 previous deliveries", style: TextStyle(fontSize: 18, color: CustomTheme.getLight() ? Colors.black : Colors.white)),],//_LogHoursState._total.toString()
                  ),
                )
            ),
          ),
        ],
      );
    }
    if(listDeliver.length >= 3)
    {
      returning = ListBody(
        children: [
          organize(context, 1, "car", "delivery", volunteer),
          organize(context, 2, "car", "delivery", volunteer),
          organize(context, 3, "car", "delivery", volunteer),
        ],
      );
    }
    if(listDeliver.length == 2)
    {
      returning = ListBody(
        children: [
          organize(context, 1, "cart", "delivery", volunteer),
          organize(context, 2, "cart", "delivery", volunteer),
        ],
      );
    }
    if(listDeliver.length == 1)
    {
      returning = ListBody(
        children: [
          organize(context, 1, "cart", "delivery", volunteer),
        ],
      );
    }
  }
  return returning;
}

Widget organize(BuildContext context, int number, String which, String widg, Volunteer volunteer){
  Widget returning = new Container();
  if(widg == "pickup")
    {
      returning = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Icon(NamesDates().whichIcon(which), color: Color(0xFFE0CB8F), size: 34,), ),
          Expanded(
            child: Container(padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                child: TextButton(onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NamesDates().whichWidg(number, widg, volunteer)),);},
                  style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Color(0xFFE0CB8F);
                        return Color(0xFFE0CB8F);
                      }), shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFFE0CB8F), width: 2)),),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),),
                  child: ListBody(children: [
                    Text(volunteer.getVolunteerPickups().elementAt(volunteer.getVolunteerPickups().length-number).getName(), style: TextStyle(fontSize: 18, color: CustomTheme.getLight() ? Colors.black : Colors.white,)),
                    Text("Picked up on "+volunteer.getVolunteerPickups().elementAt(volunteer.getVolunteerPickups().length-number).getDate().toString().substring(0, 5), style: TextStyle(fontSize: 13, color: CustomTheme.getLight() ? Colors.black : Color(0xFFE0CB8F)))
                  ], ),
                )),
          ),
        ],
      );
    }

  if(widg == "delivery")
    {
      returning = Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Icon(NamesDates().whichIcon(which), color: Color(0xFFE0CB8F), size: 34,), ),
          Expanded(
            child: Container(padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                child: TextButton(onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NamesDates().whichWidg(number, widg, volunteer)),);},
                  style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered))
                          return Color(0xFFE0CB8F);
                        return Color(0xFFE0CB8F);
                      }), shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Color(0xFFE0CB8F), width: 2)),),
                    padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),),
                  child: ListBody(children: [
                    Text(volunteer.getVolunteerDeliveries().elementAt(volunteer.getVolunteerDeliveries().length-number).getName(), style: TextStyle(fontSize: 18, color: CustomTheme.getLight() ? Colors.black : Colors.white,)),
                    Text("Delivered on " +volunteer.getVolunteerDeliveries().elementAt(volunteer.getVolunteerDeliveries().length-number).getDate().toString().substring(0, 5), style: TextStyle(fontSize: 13, color: CustomTheme.getLight() ? Colors.black : Color(0xFFE0CB8F)))
                  ], ),
                )),
          ),
        ],
      );
    }
  return returning;
}
Volunteer person = new Volunteer("Johnny Appleseed", "johnnyappleseed@gmail.com", "0000000000"); //pass/update volunteer info here
Column body(BuildContext context){
  volunteerLogTester(context, person);
  return Column(
    children: [
      Container(
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(0.0, 10.0, 2.0, 10.0),
                child: Text("  My Past Pickups:", style: TextStyle(fontFamily: "BigShouldersDisplay", fontWeight: FontWeight.w700, fontSize: 22),)
            ),
            Container(
                padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
                child: IconButton(icon: Icon(OVCIcons.forwardicon, size: 20,), onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AllPickup(volunteer: person,)));}, color: Color(0xFFE0CB8F),)
            ),
          ],
        ),
      ),
      listItems(context, "pickup", person),
      Container(
        child: Row(
          children: [
            Text("  My Past Deliveries:", style: TextStyle(fontFamily: "BigShouldersDisplay", fontWeight: FontWeight.w700, fontSize: 22),),
            Container(
                padding: EdgeInsets.fromLTRB(0.0, 4.0, 0.0, 0.0),
                child: IconButton(icon: Icon(OVCIcons.forwardicon, size: 20,), onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AllDelivery(volunteer: person,)),);},
                  color: Color(0xFFE0CB8F),)
            ),
          ],
        ),
      ),
      listItems(context, "delivery", person),
      Container(
        child: Row(
          children: [
            Text("  Total Volunteer Hours:", style: TextStyle(fontFamily: "BigShouldersDisplay", fontWeight: FontWeight.w700, fontSize: 22),),
            Container(
                padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
            ),
          ],
        ),
      ),
      Row(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.account_balance_wallet_rounded, color: Color(0xFFE0CB8F), size: 34,), ),
          Expanded(
            child: Container(padding: EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
                child: TextButton(onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogHours(volunteer: person,)),);},
                  style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.hovered))
                        return Color(0xFFE0CB8F);
                      return Color(0xFFE0CB8F); // Defer to the widget's default.
                    }), shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(color: Color(0xFFE0CB8F), width: 2)), ),
                  padding: MaterialStateProperty.all(EdgeInsets.all(10.0)),),
                  child: ListBody(children: [
                    Text(LogHours.getTotal().toString() + hourOrHours(), style: TextStyle(fontSize: 18, color: CustomTheme.getLight() ? Colors.black : Colors.white)),],//_LogHoursState._total.toString()
                  ),
                )
            ),
          ),
        ],
      )
    ],
  );
}

String hourOrHours() {
  String returning = "";
  if(LogHours.getTotal() == 1){
    returning = " hour";
  }
  if(LogHours.getTotal() != 1){
    returning = " hours";
  }
  return returning;
}

class NamesDates extends StatelessWidget{

  Widget whichWidg(int num, String whichWidget, Volunteer volunteer) {
    Widget returning = IndividualPickup(num: num, volunteer: volunteer,);
    if(whichWidget == "pickup")
    {
      returning = IndividualPickup(num: num, volunteer: volunteer,);
    }
    if(whichWidget == "delivery"){
      returning = IndividualDelivery(num: num, volunteer: volunteer,);
    }
    return returning;
  }

  IconData? whichIcon(String which) {
    IconData returning = Icons.add_shopping_cart;
    if(which == "cart")
    {
      returning = OVCIcons.pickupicon;
    }
    if(which == "car")
    {
      returning = Icons.airport_shuttle_rounded;
    }
    if(which == "log")
    {
      returning = Icons.account_balance_wallet_rounded;
    }
    return returning;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

}
