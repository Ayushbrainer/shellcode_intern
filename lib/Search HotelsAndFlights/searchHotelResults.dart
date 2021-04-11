import 'package:flutter/material.dart';
import 'package:shellcode_internship/Perform/searchHotels.dart';
import 'package:shellcode_internship/Search HotelsAndFlights/resultHotelsContainer.dart';
import 'package:shellcode_internship/home page/settings.dart';
import 'package:shellcode_internship/Perform/searchFlights.dart';

String selectedHotel = "";

class hotelsResultPage extends StatefulWidget {
  Duration nights;
  hotelsResultPage({this.nights});
  @override
  _hotelsResultPageState createState() => _hotelsResultPageState();
}

class _hotelsResultPageState extends State<hotelsResultPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Text(""),
        flexibleSpace: Container(
          width: size.width*0.8,
          height: size.height*0.06,
          decoration: BoxDecoration(
            color: Color(0xFFdddddd),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          margin: EdgeInsets.only(top: size.height*0.05,left: size.width*0.02,right: size.width*0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.sort_by_alpha),
              Text("$addressUrl"),
              Icon(Icons.refresh)
            ],
          ),
        ),
      ),


      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:8.0),
            child: travelInfoContainer(nights: widget.nights.inDays,),
          ),
          hotelsContainer(no: 1,),
          hotelsContainer(no: 2,),
          hotelsContainer(no: 3,),
          hotelsContainer(no: 4,),
          hotelsContainer(no: 5,),
          hotelsContainer(no: 6,),
          hotelsContainer(no: 7,),
          hotelsContainer(no: 8,),
          hotelsContainer(no: 9,),
          hotelsContainer(no: 10,),
        ],
      ),
    );
  }
}

class travelInfoContainer extends StatelessWidget {
  int nights;
  travelInfoContainer({this.nights});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.9,
      height: size.height*0.25,
      decoration: BoxDecoration(color: Color(0xFFbc6ff1),
      boxShadow: <BoxShadow>[
        BoxShadow(color: Colors.black.withOpacity(0.15),
        blurRadius: 10,spreadRadius: 6)
      ],
      borderRadius: BorderRadius.all(Radius.circular(20))),
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      margin: EdgeInsets.symmetric(horizontal: size.width*0.025,vertical: size.height*0.01),
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Container(
           height: size.height*0.05,
           width: size.width*1,
           child: Container(
            color: Colors.transparent,
            width: size.width*0.35,
            child: Text("$toField",style: TextStyle(
             color: Colors.white,
             fontSize: size.width*0.059,
             fontWeight: FontWeight.w700
            ),),
           ),
         ),
         Container(
          height: size.height*0.059,
          width: size.width*1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$nights Nights",style: TextStyle(
               color: Colors.white,
               fontSize: size.width*0.048,
               fontWeight: FontWeight.w500
             ),),
              Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Text("$rooms Rooms",style: TextStyle(
                   color: Colors.white,
                   fontSize: size.width*0.048,
                   fontWeight: FontWeight.w500
                 ),),
                 Text("$adults Adults",style: TextStyle(
                   color: Colors.white,
                   fontSize: size.width*0.048,
                   fontWeight: FontWeight.w500
                 ),),
                 Text("$children Children",style: TextStyle(
                   color: Colors.white,
                   fontSize: size.width*0.048,
                   fontWeight: FontWeight.w500
                 ),),
               ], 
              ),
            ],
          ),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("Check In Time",style: TextStyle(
             color: Colors.white.withOpacity(0.7)
           ),),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text("${startDate.toString().substring(11,endDate.toString().length-4)}",style: TextStyle(
             color: Colors.white
           ),),
         )
       ],
      ),
    );
  }
}