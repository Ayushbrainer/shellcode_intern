import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shellcode_internship/home%20page/settings.dart';

import '../../colors.dart';
import '../searchFlights.dart';

class forceCars extends StatefulWidget {
  List Cities,cars;
  forceCars({this.Cities,this.cars});
  @override
  _forceCarsState createState() => _forceCarsState();
}

class _forceCarsState extends State<forceCars> {
  String fromCity = "A Coruña", toCity = "A Coruña", car = "KiaeSoul";
  _startDatePicker() async {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        minTime: DateTime(1960, 1, 1),
        maxTime: DateTime(2050, 12, 31), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      setState(() {
        startDate = date;
      });
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  _endDatePicker() async {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        minTime: startDate,
        maxTime: DateTime(2050, 12, 31), onChanged: (date) {
      print('change $date');
    }, onConfirm: (date) {
      setState(() {
        endDate = date;
      });
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * 0.6,
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Search Cars",
              style: TextStyle(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.w800,
                  color: kPrimaryColor),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Picking from",
              style: TextStyle(fontSize: size.width * 0.04),
            ),
          ),
          Container(
            color: kPrimaryLightColor,
            padding: EdgeInsets.all(10),
            child: DropdownButton(
                onChanged: (e) {
                  setState(() {
                    fromCity = e;
                  });
                },
                value: fromCity,
                icon: Icon(Icons.arrow_drop_down),
                elevation: 20,
                style: TextStyle(
                  color: Color.fromRGBO(8, 34, 119, 1),
                ),
                underline: Container(
                  color: kPrimaryLightColor,
                ),
                items: widget.Cities.map<DropdownMenuItem>((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e.toString()),
                  );
                }).toList()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Dropping Off",
              style: TextStyle(fontSize: size.width * 0.04),
            ),
          ),
          Container(
            color: kPrimaryLightColor,
            padding: EdgeInsets.all(10),
            child: DropdownButton(
                onChanged: (e) {
                  setState(() {
                    toCity = e;
                  });
                },
                value: toCity,
                icon: Icon(Icons.arrow_drop_down),
                elevation: 20,
                style: TextStyle(
                  color: Color.fromRGBO(8, 34, 119, 1),
                ),
                underline: Container(
                  color: kPrimaryLightColor,
                ),
                items: widget.Cities.map<DropdownMenuItem>((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e.toString()),
                  );
                }).toList()),
          ),
          Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Pick A Car",
                    style: TextStyle(fontSize: size.width * 0.04),
                  ),
                ),
          Container(
            color: kPrimaryLightColor,
            padding: EdgeInsets.all(10),
            child: DropdownButton(
                onChanged: (e) {
                  setState(() {
                    car = e;
                  });
                },
                value: car,
                icon: Icon(Icons.arrow_drop_down),
                elevation: 20,
                style: TextStyle(
                  color: Color.fromRGBO(8, 34, 119, 1),
                ),
                underline: Container(
                  color: kPrimaryLightColor,
                ),
                items: widget.cars.map<DropdownMenuItem>((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e.toString()),
                  );
                }).toList()),
          ),
          Row(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Start Date"),
                    TextButton(
                        onPressed: _startDatePicker,
                        child: Container(
                          width: size.width * 0.4,
                          height: size.height * 0.08,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                              child: Text(startDate
                                      .toIso8601String()
                                      .substring(0, 10) +
                                  " at " +
                                  startDate.toString().substring(
                                      12, startDate.toString().length - 4))),
                        ),
                        style: TextButton.styleFrom(primary: kPrimaryColor)),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text("End Date"),
                    TextButton(
                        onPressed: _endDatePicker,
                        child: Container(
                          width: size.width * 0.4,
                          height: size.height * 0.08,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          margin: EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              color: kPrimaryLightColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Center(
                              child: Text(
                                  endDate.toIso8601String().substring(0, 10) +
                                      " at " +
                                      endDate.toString().substring(
                                          12, endDate.toString().length - 4))),
                        ),
                        style: TextButton.styleFrom(primary: kPrimaryColor)),
                  ],
                ),
              ),
            ],
          ),
          (isForced)? tripContainer(3) :Text("")
        ],
      ),
    );
  }


    Widget tripContainer(int no){
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.29,
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purpleAccent[400]),
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      margin: EdgeInsets.symmetric(horizontal: size.width*0.06,vertical: size.height*0.0),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: size.height*0.2,
            width: size.width,
            child: Image.asset("assets/images/bottomImage$no.jpeg",fit: BoxFit.fill,),
          ),
          TextButton(onPressed: (){}, child: Text("See Details"))
        ],
      ),
    );
  }
}
