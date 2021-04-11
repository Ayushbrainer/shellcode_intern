import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:shellcode_internship/Customize/mainCustomPage.dart';
import 'package:shellcode_internship/Perform/travelHomePage.dart';
import 'package:shellcode_internship/colors.dart';
import 'package:shellcode_internship/home%20page/rounded_button.dart';
import 'package:shellcode_internship/home%20page/settings.dart';
import 'package:shellcode_internship/home%20page/videoTut.dart';
import 'package:shellcode_internship/login/signIn.dart';
import 'package:shellcode_internship/main.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Virtual Destination",style: TextStyle(
            color: Colors.white,
            fontSize: size.height*0.0278,
          ),),
          centerTitle: true,
          leading: FocusedMenuHolder(child: Icon(Icons.info),onPressed: (){},
            menuItems: [
              FocusedMenuItem(title: Text("Help"), onPressed: (){}),
              FocusedMenuItem(title: Text("About Virtual Destination"), onPressed: (){}),
              FocusedMenuItem(title: Text("Read Instruction"), onPressed: (){}),
              FocusedMenuItem(title: Text("Log Out"), onPressed: (){
                isLoggedIn = false;
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignIn()));
              })
            ],),
          actions: [
            IconButton(icon: Icon(Icons.settings), onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>settings()));
            })
          ],
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                height: size.height,
                width: size.width,
                child: Image.asset("assets/images/homePage.png",fit: BoxFit.fill,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(left:size.width*0.1),
                      child: RoundedButton(text: "Video Tutorial",textColor: Colors.white,color: kPrimaryColor,press: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ytVidPlayer()));
                      },)),
                  Padding(
                      padding: EdgeInsets.only(left:size.width*0.1),
                      child: RoundedButton(text: "Customise",textColor: Colors.white,color: kPrimaryColor,press: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>customise()));
                      },)),
                  Padding(
                      padding: EdgeInsets.only(left:size.width*0.1),
                      child: RoundedButton(text: "Perform",textColor: Colors.white,color: kPrimaryColor,press: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>performHome()));
                      },))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
