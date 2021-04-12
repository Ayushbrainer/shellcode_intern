import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
import 'package:shellcode_internship/colors.dart';
import 'package:shellcode_internship/home%20page/rounded_input_field.dart';

String addressUrl = "www.wholesale.com";
String currency = "\$";
File imageFile;
bool isForced = false;

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  bool isPreloaded = false;
  bool isPerformance = false;
  String changeCurrency;
  String changeUrl;
  int countdown;

  Future<void> pickImage() async{
    FilePickerResult result = await FilePicker.platform.pickFiles(type: FileType.any);

    if(result != null) {
      imageFile = File(result.files.single.path);
    } else {
      // User canceled the picker
    }
  }

  // final picker = ImagePicker();

  // Future<void> takePic() async {
  //   PickedFile selectedImg = await picker.getImage(source: ImageSource.gallery);

  //   setState(() {
  //     imageFile = File(selectedImg.path);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        height: size.height*0.9,
        width: size.width*0.9,
        alignment: Alignment.center,
        child: Stack(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: Image.asset("assets/images/settings.png",fit: BoxFit.fill,),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: size.height*0.1,
                    width: size.width*0.9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Force Mode",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: size.width*0.06
                          ),),
                        Switch(value: isForced, onChanged: (val){
                          setState(() {
                            if(val){
                              isForced = true;
                            }else{
                              isForced = false;
                            }
                          });
                        },
                          activeColor: kPrimaryColor,)
                      ],
                    )),
                Container(
                    height: size.height*0.1,
                    width: size.width*0.9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Preloaded Listing",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: size.width*0.06
                          ),),
                        Switch(value: isPreloaded, onChanged: (val){
                          setState(() {
                            if(val){
                              isPreloaded = true;
                            }else{
                              isPreloaded = false;
                            }
                          });
                        },
                          activeColor: kPrimaryColor,)
                      ],
                    )),
                Container(
                  height: size.height*0.1,
                  width: size.width*0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Change homepage image",style: TextStyle(
                          fontSize: size.width*0.05,
                          color: kPrimaryColor
                      ),),
                      SizedBox(
                        width: size.width*0.01,
                      ),
                      (imageFile==null)?TextButton(child: Text("Select an image",style:TextStyle(
                        fontSize: size.width*0.02
                      ),),onPressed: pickImage,):Container(height:size.height*0.3,width: size.width*0.3,decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))
                      ),child: FlatButton(child: Image.file(imageFile),onPressed: pickImage,))
                    ],
                  ),
                ),
                Container(
                  height: size.height*0.1,
                  width: size.width*0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Change Address Bar url",style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: size.width*0.05
                      ),),
                      IconButton(icon: Icon(Icons.link,color: Colors.black,), onPressed: ()async{
                        await showDialog(context: context, builder: (context){
                          return AlertDialog(
                            content: Form(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Address Url"),
                                RoundedInputField(
                                  icon: Icons.link,
                                  hintText: "address url",
                                  onChanged: (url){
                                    setState(() {
                                      changeUrl = url;
                                    });
                                  },
                                )
                              ],

                            )),
                            actions: [
                              TextButton(onPressed: (){
                                setState(() {
                                  addressUrl = changeUrl;
                                });
                                Navigator.pop(context);
                              }, child: Text("OK")),
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("Cancel"))
                            ],
                          );
                        });
                      })
                    ],
                  ),
                ),
                Container(
                  height: size.height*0.1,
                  width: size.width*0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Change Currency",style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: size.width*0.05
                      ),),
                      Text("$currency",style: TextStyle(
                        fontSize: size.width*0.08
                      ),),
                      IconButton(icon: Icon(Icons.monetization_on_outlined,color: Colors.black,), onPressed: ()async{
                        await showDialog(context: context, builder: (context){
                          return AlertDialog(
                            content: Form(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Currency"),
                                RoundedInputField(
                                  icon: Icons.monetization_on_outlined,
                                  hintText: "Currency",
                                  onChanged: (url){
                                    setState(() {
                                      changeCurrency = url;
                                    });
                                  },
                                )
                              ],

                            )),
                            actions: [
                              TextButton(onPressed: (){
                                setState(() {
                                  currency = changeCurrency;
                                });
                                Navigator.pop(context);
                              }, child: Text("OK")),
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("Cancel"))
                            ],
                          );
                        });
                      })
                    ],
                  ),
                ),
                Container(
                  height: size.height*0.1,
                  width: size.width*0.9,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Update Countdown",style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: size.width*0.05
                      ),),
                      Text("$countdown"),
                      IconButton(icon: Icon(Icons.timer,color: Colors.black,), onPressed: ()async{
                        await showDialog(context: context, builder: (context){
                          return AlertDialog(
                            content: Form(child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text("Enter Countdown"),
                                RoundedInputField(
                                  icon: Icons.timer,
                                  hintText: "countdown",
                                  onChanged: (url){
                                    setState(() {
                                      countdown = int.parse(url);
                                    });
                                  },
                                )
                              ],

                            )),
                            actions: [
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("OK")),
                              TextButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("Cancel"))
                            ],
                          );
                        });
                      })
                    ],
                  ),
                ),
                Container(
                    height: size.height*0.1,
                    width: size.width*0.9,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Performance Mode",
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: size.width*0.06
                          ),),
                        Switch(value: isPerformance, onChanged: (val){
                          setState(() {
                            if(val){
                              isPerformance = true;
                            }else{
                              isPerformance = false;
                            }
                          });
                        },
                          activeColor: kPrimaryColor,)
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
