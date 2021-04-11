import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shellcode_internship/Perform/searchHotelsAndFlights.dart';
import 'package:shellcode_internship/Perform/searchFlights.dart';
import 'package:shellcode_internship/Perform/searchCars.dart';
import 'package:shellcode_internship/Perform/searchHotels.dart';
import 'file:///C:/Users/nmabh/AndroidStudioProjects/shellcode_internship/lib/Perform/topBar.dart';
import 'package:shellcode_internship/home%20page/settings.dart';

class performHome extends StatefulWidget {
  @override
  _performHomeState createState() => _performHomeState();
}

class _performHomeState extends State<performHome> {
  PageController _pageController = PageController(initialPage: 0);
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
              Text("${addressUrl}"),
              Icon(Icons.refresh)
            ],
          ),
        ),
      ),

      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          topBar(pageController: _pageController,),
          Container(
            width: size.width,
            height: size.height*0.3,
            child: (imageFile!=null)?Image.file(imageFile,fit: BoxFit.fill,):Image.asset("assets/images/customise1.png",fit: BoxFit.fill,),
          ),
          Container(
            // width: size.width,
            height: size.height*0.75,
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                srchFlights(),
                srchHotels(),
                srchCars(),
                srch_Hotels_Flights(),
              ],
            ),
          )
        ],
      ),

    );
  }
}



