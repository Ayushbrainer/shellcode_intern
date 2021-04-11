import 'package:flutter/material.dart';
import 'package:shellcode_internship/Perform/searchFlights.dart';
import 'package:shellcode_internship/Perform/searchHotels.dart';
import 'package:shellcode_internship/Search%20HotelsAndFlights/searchHotelResults.dart';
import 'package:shellcode_internship/home%20page/settings.dart';

class hotel_booking_confirm extends StatelessWidget {
  Duration nights = endDate.difference(startDate);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle normalText = TextStyle(
    color: Color(0xFFbf00ff),
    fontSize: size.width*0.045,
    );
    TextStyle highlightedText = TextStyle(
      color: Color(0xFFbf00ff),
    fontSize: size.width*0.053,
    fontWeight: FontWeight.w700
    );
    return Container(
      height: size.height*0.42,
      width: size.width,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("Hotel",style: normalText,),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("$selectedHotel",style: highlightedText,),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("Check - In Time",style: normalText,),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("${startDate.toString().substring(11,startDate.toString().length-7)}",style: highlightedText,),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("Price",style: normalText,),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text("$currency ${79*nights.inDays}",style: highlightedText,),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: Text("${nights.inDays} Days  $adults Adults  $children Children",style: normalText,),
          ),
        ],
      ),
    );
  }
}