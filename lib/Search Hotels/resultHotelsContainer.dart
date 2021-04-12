import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shellcode_internship/Search%20Hotels/bookingConfirmPage.dart';
import 'package:shellcode_internship/home%20page/settings.dart';

List<String> hotelsList = ["Hilton","Holiday Inn","Best Western","Ramada","Travel Lodge","Hyatt","The WestIn","InterContinetal","Radisson Blu","Marriott"];
List<int> hotelPrices = <int>[99,79,59,76,85,119,199,129,220,196];

class flightContainer extends StatefulWidget {
  int no;
  flightContainer({this.no});

  @override
  _flightContainerState createState() => _flightContainerState();
}

class _flightContainerState extends State<flightContainer> {
  String star = "⭐",stars="";
  Random rng = new Random();

  void ratingSys(){
    for(int i=0;i<rng.nextInt(5)+1;i++){
      stars+=star;
    }
  }

  @override
  void initState() { 
    super.initState();
    ratingSys();
  }

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
            child: Image.asset("assets/images/hotel${widget.no}.jpeg",
            fit: BoxFit.fill,),
          ),
          Row(
           crossAxisAlignment: CrossAxisAlignment.center,
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Padding(
               padding: const EdgeInsets.all(9.0),
               child: Text("${hotelsList[widget.no-1]}",style: TextStyle(
                 fontSize: size.width*0.045,
                 fontWeight: FontWeight.bold
               ),),
             ),
             Padding(
               padding: const EdgeInsets.all(9.0),
               child: Column(
                 children: [
                   Text("$currency ${hotelPrices[widget.no-1]}",style: TextStyle(
                     fontSize: size.width*0.035,
                     fontWeight: FontWeight.w700
                   ),),
                   Text("Per Night")
                 ],
               ),
             )
           ],
          ),
          Padding(
            padding: EdgeInsets.only(left:0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("$stars"),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>confirmBooking(no: widget.no,stars: stars,)));
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
              ],
            ),
          )
        ],
      ),
    );
  }
} 