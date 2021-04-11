import 'package:flutter/material.dart';
import 'package:shellcode_internship/Perform/searchFlights.dart';
import 'package:shellcode_internship/Search%20Flights/resultFlightsContainer.dart';

class firstContainer extends StatelessWidget {
  int no;
  firstContainer({this.no});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height * 0.3,
              decoration: BoxDecoration(
                color: Colors.purpleAccent[400],
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      spreadRadius: 6)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(size.width*0.03),
                    margin: EdgeInsets.all(size.width*0.02),
                    width: size.width,
                    height: size.height*0.08,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(size.width*0.02),
                          child: Container(
                            child: Text("${(toField!=null)?toField.toUpperCase():toField}",style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width*0.05,
                              fontWeight: FontWeight.w700,
                            ),overflow: TextOverflow.visible,),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top:size.height*0.01),
                          child: Text("to",style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width*0.05,
                            fontWeight: FontWeight.w300
                          ),),
                        ),
                        Padding(
                          padding:  EdgeInsets.all(size.width*0.02),
                          child: Flexible(
                            child: Container(
                              child: Text("${(fromField!=null)?fromField.toUpperCase():fromField}",style: TextStyle(
                                color: Colors.white,
                                fontSize: size.width*0.05,
                                fontWeight: FontWeight.w700
                              ),overflow: TextOverflow.visible,),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    width: size.width,
                    padding: EdgeInsets.all(size.width*0.02),
                    margin: EdgeInsets.all(10),
                  ),
                  Container(
                   width: size.width,
                   child: Row(
                     crossAxisAlignment: CrossAxisAlignment.center,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         height: size.height*0.08,
                         padding: EdgeInsets.all(size.width*0.02),
                         child: Column(
                           children: [
                             Text("Departure",style: TextStyle(
                               color: Colors.white
                             ),),
                             Text("${startDate.toString().substring(0,10)}",style: TextStyle(
                               color: Colors.white
                             ),)
                           ],
                         ),
                       ),
                       Container(
                         height: size.height*0.08,
                         padding: EdgeInsets.all(size.width*0.02),
                         child: Column(
                           children: [
                             Text("Returning",style: TextStyle(
                               color: Colors.white
                             ),),
                             Text("${endDate.toString().substring(0,10)}",style: TextStyle(
                               color: Colors.white
                             ),)
                           ],
                         ),
                       )
                     ],
                   ), 
                  ),
                  Padding(
                    padding: EdgeInsets.all(size.width*0.02),
                    child: Text("${airlines[no-1]}",style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width*0.04
                    ),),
                  )
                ],
              ),
            ),
          );
  }
}