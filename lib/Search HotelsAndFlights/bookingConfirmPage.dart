import 'package:flutter/material.dart';
import 'package:shellcode_internship/Perform/searchFlights.dart';
import 'package:shellcode_internship/Search%20Flights/resultFlightsContainer.dart';
import 'package:shellcode_internship/Search%20Hotels/resultHotelsContainer.dart';
import 'package:shellcode_internship/Search%20HotelsAndFlights/flightConfirmCont.dart';
import 'package:shellcode_internship/Search%20HotelsAndFlights/hotelConfirmCont.dart';
import 'package:shellcode_internship/Search%20HotelsAndFlights/resultFlightsContainer.dart';
import 'package:shellcode_internship/Search%20HotelsAndFlights/resultHotelsContainer.dart';
import 'package:shellcode_internship/home%20page/settings.dart';
import 'package:shellcode_internship/main.dart';

class flight_and_hotels_booking_confirm extends StatefulWidget {
  int flightNo,hotelNo;
  flight_and_hotels_booking_confirm({this.flightNo,this.hotelNo});
  @override
  _flight_and_hotels_booking_confirmState createState() => _flight_and_hotels_booking_confirmState();
}

class _flight_and_hotels_booking_confirmState extends State<flight_and_hotels_booking_confirm> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color(0xFFb9fffc),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Text(""),
        flexibleSpace: Container(
          width: size.width * 0.8,
          height: size.height * 0.06,
          decoration: BoxDecoration(
              color: Color(0xFFdddddd),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          margin: EdgeInsets.only(
              top: size.height * 0.05,
              left: size.width * 0.02,
              right: size.width * 0.02),
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
          Container(
            padding: EdgeInsets.all(size.width*0.05),
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(size.width*0.02),
                  child: Text("Your trip to",style: TextStyle(
                    color: Color(0xFFbf00ff),
                    fontSize: size.width*0.056
                  ),),
                ),
                Text("$toField",style: TextStyle(
                  color: Color(0xFFbf00ff),
                  fontSize: size.width*0.056,
                  fontWeight: FontWeight.bold
                ),),
              ],
            ),
          ),
          Container(
            width: size.width,
            height: 5,
            margin: EdgeInsets.symmetric(horizontal: size.width*00.056),
            decoration: BoxDecoration(
              color: Color(0xFFbf00ff),
              borderRadius: BorderRadius.all(Radius.circular(16))
              ),
          ),
          flightBookingConfirmContainer(),
          Container(
            width: size.width,
            height: 5,
            margin: EdgeInsets.symmetric(horizontal: size.width*00.056),
            decoration: BoxDecoration(
              color: Color(0xFFbf00ff),
              borderRadius: BorderRadius.all(Radius.circular(16))
              ),
          ),
          hotel_booking_confirm(no: widget.hotelNo,),
           Container(
            width: size.width,
            height: 5,
            margin: EdgeInsets.symmetric(horizontal: size.width*00.056),
            decoration: BoxDecoration(
              color: Color(0xFFbf00ff),
              borderRadius: BorderRadius.all(Radius.circular(16))
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Reviews",style:TextStyle(
              color: Color(0xFFbf00ff),
              fontSize: size.width*0.065,
              fontWeight: FontWeight.bold
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("$flightsAndHotelsReview",style: TextStyle(
              color: Color(0xFFbf00ff),
              fontSize: size.width*0.056,
            ),),
          ),
          Container(
            height: size.height * 0.12,
          )
        ],
      ),
      bottomSheet: bottomSheet(hotelNo: widget.hotelNo,flightNo: widget.flightNo,),
    );
  }
}



class bottomSheet extends StatelessWidget {
  Duration nights = endDate.difference(startDate);
  int hotelNo,flightNo;
  bottomSheet({this.flightNo,this.hotelNo});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int totalPrice = (nights.inDays*selectedHotelPrice)+selectedFlightPrice;
    //print(totalPrice);
    return Container(
      width: size.width,
      height: size.height * 0.12,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              spreadRadius: 6)
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
                left: size.width * 0.03, right: 10, top: 12, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text("Trip Total",
                      style: TextStyle(fontSize: size.width * 0.05)),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "$currency $totalPrice",
                    style: TextStyle(
                        fontSize: size.width * 0.05,
                        fontWeight: FontWeight.w700),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
                onPressed: () {},
                child: Container(
                  width: size.width * 0.32,
                  height: size.height * 0.09,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Text(
                    "Check Out",
                    style: TextStyle(
                        color: Colors.white, fontSize: size.width * 0.05),
                  ),
                )),
          )
        ],
      ),
    );
  }
}