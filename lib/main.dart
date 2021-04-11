import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shellcode_internship/Network/cities.dart';
import 'package:shellcode_internship/Network/dataFetch.dart';
import 'package:shellcode_internship/home%20page/homePage.dart';
import 'package:shellcode_internship/login/signIn.dart';

bool isLoggedIn = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

String flightReview = "The flights were exceptional.\n\n The seats and legroom was so comfortable and the on board refreshments were very nice.\n\n The location of the check in desk is very close to the duty free shops.\n\n The airline can also provide Accommodation close to the airport if your flight is early in the morning so you can stay the night before in the airport hotel and recharge before your flight.\n\n I would only use this airline again. ⭐ ⭐ ⭐ ⭐";

String hotelReview = "Great location, superb value.\n\n We received free refreshments on our arrival.\n\n The room was very nice and the bed was comfortable and the Accommodation was first class.\n\n Shops, bars, and places to dine out are within walking distance.\n\n The service was Exceptional You can relax and recharge here Can’t wait to return next year.\n ⭐ ⭐ ⭐ ⭐";

String carReview = "The location of the car hire was just outside the arrival gate.\n\n The staff were exceptional and offered to carry our bags to the car.\n\n The car we choose was so comfortable and the drive to our accommodation was a pleasure to drive.\n\n We arrived early at our hotel and had free refreshments on arrival.\n ⭐ ⭐ ⭐ ⭐";

String flightsAndHotelsReview = "We got a great package deal booking our flights and hotel at the same time.\n\n The price was exceptional.\n\n On board the flight we had great leg room and free refreshments.\n\n The accommodation was lovely and the bed was very comfortable.\n\n The location was close to the shops and bars.\n\n Can't wait to go back again.\n⭐ ⭐ ⭐ ⭐";

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (isLoggedIn)?homePage():SignIn(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Cities> data;
  
  int _counter = 0;
  // FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    // cityNetwork citynetwork = cityNetwork();
    // data = citynetwork.getCities();
    super.initState();
  }

  void _incrementCounter() {
    // firestore.collection('lists').add({
    //         'Hotels':FieldValue.arrayUnion(hotels)
    //       }).then((value) => print("OK")).catchError((onError)=>print("Error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<Cities>(builder: (context,AsyncSnapshot<Cities> asyncSnapshot){
        if(asyncSnapshot.hasData){
          // asyncSnapshot.data.cities.forEach((element) {
          //   element.cities.forEach((e) {
          //     cityes.add(e);
          //   });
          // });
          // firestore.collection('lists').doc('airlines').update({
          //   'Cars':FieldValue.arrayUnion(cars)
          // }).then((value) => print("OK")).catchError((onError)=>print(onError));
          // print(cityes.length);
          return Text("Snapshot has data "+asyncSnapshot.data.cities[0].country);
        }else{
          return Center(child: CircularProgressIndicator());
        }
      },
      future: data,),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
