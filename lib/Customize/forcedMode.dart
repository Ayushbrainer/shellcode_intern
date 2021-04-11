import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shellcode_internship/Customize/rounded_button.dart';
import 'package:shellcode_internship/Customize/rounded_input_field.dart';

class forceMode extends StatefulWidget {
  @override
  _forceModeState createState() => _forceModeState();
}

class _forceModeState extends State<forceMode> {
  String from, to, hotel, car, flight;
  GlobalKey<AutoCompleteTextFieldState<String>> toKey = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> fromKey = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> hotelKey = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> carKey = new GlobalKey();
  GlobalKey<AutoCompleteTextFieldState<String>> flightKey = new GlobalKey();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.3,
        width: size.width,
        child: FutureBuilder(
          future: firestore.collection('lists').doc('airlines').get(),
          builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                SizedBox(
                  height: size.height * 0.1,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: RoundedInputField(
                    hintText: "From",
                    suggestions: snapshot.data['Cities'],
                    kEy: fromKey,
                    icon: Icons.home,
                    onChanged: (str) {
                      setState(() {
                        from = str;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: RoundedInputField(
                    hintText: "To",
                    suggestions: snapshot.data['Cities'],
                    icon: Icons.home,
                    kEy: toKey,
                    onChanged: (str) {
                      setState(() {
                        to = str;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: RoundedInputField(
                    hintText: "Hotel",
                    kEy: hotelKey,
                    suggestions: snapshot.data['Hotels'],
                    icon: Icons.home,
                    onChanged: (str) {
                      setState(() {
                        hotel = str;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: RoundedInputField(
                    hintText: "Car",
                    kEy: carKey,
                    suggestions: snapshot.data['Cars'],
                    icon: Icons.home,
                    onChanged: (str) {
                      setState(() {
                        car = str;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                  child: RoundedInputField(
                    hintText: "Flights",
                    kEy: flightKey,
                    icon: Icons.home,
                    suggestions: snapshot.data['flights'],
                    onChanged: (str) {
                      setState(() {
                        flight = str;
                      });
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * 0.24),
                  child: RoundedButton(
                    text: "Submit",
                    press: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        }));
  }
}
