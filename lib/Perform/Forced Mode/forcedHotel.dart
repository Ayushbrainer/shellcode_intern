import 'package:flutter/material.dart';

import '../../colors.dart';

class forcedHotelDropdown extends StatefulWidget {
  List hotels;
  forcedHotelDropdown({this.hotels});
  @override
  _forcedHotelDropdownState createState() => _forcedHotelDropdownState();
}

class _forcedHotelDropdownState extends State<forcedHotelDropdown> {
  String hotel = "RitzCarlton";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            width: size.width,
            decoration: BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.all(Radius.circular(22))),
            child: DropdownButton(
                onChanged: (e) {
                  setState(() {
                    hotel = e;
                  });
                },
                value: hotel,
                icon: Icon(Icons.arrow_drop_down),
                elevation: 20,
                style: TextStyle(
                  color: Color.fromRGBO(8, 34, 119, 1),
                ),
                underline: Container(
                  color: Colors.transparent,
                ),
                items: widget.hotels.map<DropdownMenuItem>((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e.toString()),
                  );
                }).toList()),
          );
  }
}