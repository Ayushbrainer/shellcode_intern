import 'package:flutter/material.dart';
import 'package:shellcode_internship/Search%20HotelsAndFlights/bookingConfirmPage.dart';
import 'package:shellcode_internship/Search%20HotelsAndFlights/searchResult.dart';
import 'package:shellcode_internship/home page/settings.dart';
import 'package:shellcode_internship/randomTimeGenerator.dart';

List<int> flightsPrices = <int>[459];

List<String> airlines = <String>[
    "American Airlines","British Ailines","Delta Airlines",
    "RyanAir","Fly Emirates","Etihad Airways",
    "EasyJet","Lufthansa"
  ];

class flightContainer extends StatefulWidget {
  int no;
  flightContainer({this.no});

  @override
  _flightContainerState createState() => _flightContainerState();
}

class _flightContainerState extends State<flightContainer> {
  DateTime dateTime = timeGenerator();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height*0.02,horizontal: size.width*0.02),
      width: size.width,
      height: size.height*0.4,
      decoration: BoxDecoration(
       color: Colors.white,
       borderRadius: BorderRadius.all(Radius.circular(22)),
       boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black.withOpacity(0.15),
        blurRadius: 10,spreadRadius: 6)
      ],
      
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: size.height*0.2,
            width: size.width,
            child: Image.asset("assets/images/airlines${widget.no}.jpeg",
            fit: BoxFit.fill,),
          ),
          Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Padding(
               padding: const EdgeInsets.all(9.0),
               child: Text("${airlines[widget.no-1]}",style: TextStyle(
                 fontSize: size.width*0.045,
                 fontWeight: FontWeight.bold
               ),),
             ),
             Padding(
               padding: const EdgeInsets.all(9.0),
               child: Text("$currency 459",style: TextStyle(
                 fontSize: size.width*0.035
               ),),
             )
           ],
          ),
          Padding(
            padding: EdgeInsets.only(right:size.width*0.45,left: 10),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Departure Timing",style: TextStyle(
                    fontSize: size.width*0.035
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${dateTime.toString().substring(11,dateTime.toString().length-7)}"),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:size.width*0.5),
            child: TextButton(onPressed: (){
              setState(() {
                selectedAirline = airlines[widget.no-1];
              });
              print(selectedAirline);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>flight_and_hotels_booking_confirm()));
            },
            style: ButtonStyle(),
            child: Container(
              width: size.width*0.29,
              height: size.height*0.06,
              decoration: BoxDecoration(
               border: Border.all(color: Colors.purpleAccent[400]),
               borderRadius: BorderRadius.all(Radius.circular(14))
              ),
              child: Center(child: Text("Book",textAlign: TextAlign.center,style: TextStyle(
                fontSize: size.width*0.05,
               color: Colors.deepPurpleAccent
              ),)))),
          )
        ],
      ),
    );
  }
} 