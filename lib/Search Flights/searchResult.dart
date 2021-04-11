import 'package:flutter/material.dart';
import 'package:shellcode_internship/Perform/searchHotels.dart';
import 'package:shellcode_internship/Search%20Flights/resultFlightsContainer.dart';
import 'package:shellcode_internship/home page/settings.dart';
import 'package:shellcode_internship/Perform/searchFlights.dart';

class resultPage extends StatefulWidget {
  @override
  _resultPageState createState() => _resultPageState();
}

class _resultPageState extends State<resultPage> {
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
            child: travelInfoContainer(),
          ),
          flightContainer(no: 1,),
          flightContainer(no: 2,),
          flightContainer(no: 3,),
          flightContainer(no: 4,),
          flightContainer(no: 5,),
          flightContainer(no: 6,),
          flightContainer(no: 7,),
          flightContainer(no: 8,),
          // Container(
          //  width: size.width,
          //  child: ListView.builder(itemBuilder: (context,index){
          //    return Text("List"); 
          //  },itemCount: 17,),
          // )
        ],
      ),
    );
  }
}

class travelInfoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width*0.9,
      height: size.height*0.2,
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
           height: size.height*0.11,
           width: size.width*1,
           child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
               color: Colors.transparent,
               width: size.width*0.35,
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$fromField",style: TextStyle(
                   color: Colors.white,
                   fontSize: size.width*0.04
                  ),),
                  Padding(
                    padding: EdgeInsets.only(top:5.0,bottom: 4),
                    child: Text("Departure",style: TextStyle(
                     color: Colors.white 
                    ),),
                  ),
                  Text("${startDate.toString().substring(0,10)}",style: TextStyle(
                    color: Colors.white
                  ),)
                ], 
               ),
              ),
              Icon(Icons.swap_horiz_outlined,color: Colors.white,size: size.width*0.1,),
              Container(
               color: Colors.transparent,
               width: size.width*0.35,
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("$toField",style: TextStyle(
                   color: Colors.white,
                   fontSize: size.width*0.04
                  ),),
                  Padding(
                    padding: EdgeInsets.only(top:5.0,bottom: 4),
                    child: Text("Returning",style: TextStyle(
                     color: Colors.white 
                    ),),
                  ),
                  Text("${endDate.toString().substring(0,10)}",style: TextStyle(
                    color: Colors.white
                  ),)
                ], 
               ),
              ),
            ],
           ),
         ),
         Container(
          height: size.height*0.03,
          width: size.width*0.5,
          child: Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
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
         )
       ], 
      ),
    );
  }
}