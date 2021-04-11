//just bad code

// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:shellcode_internship/Network/cities.dart';

// class cityNetwork{
//   String url = "https://countriesnow.space/api/v0.1/countries";

//   Future<Cities> getCities()async{
    
//     Response response = await Dio().get(url);

//     if(response.statusCode==200){
//       print("Got 200 "+response.data['data'].toString());
//       return Cities.fromJSON(response.data['data']);
//     }else{
//       throw Exception("Not able to get data from server");
//     }
//   }
// }