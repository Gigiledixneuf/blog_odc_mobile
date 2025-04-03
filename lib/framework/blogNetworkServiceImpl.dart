import 'dart:core';
import 'dart:convert';


import 'package:blog_mobile/business/models/Authentication.dart';
import 'package:blog_mobile/business/models/User.dart';
import 'package:blog_mobile/business/services/blogNetworkService.dart';

import 'package:http/http.dart' as http;

class BlogNetworkServiceImpl implements BlogNetworkService{



  //Authentification impl ===================================================
  @override
  Future<User> authentifier (Authentification data) async {
    var url=Uri.parse("http://127.0.0.1:8000/api/login");
    var body=jsonEncode(data.toJson());
    var response= await http.post(
        url,
        body:body,
        headers : {"content-type":"application/json"}
    ) ;

    var codes=[200,201];


    var resultat=jsonDecode(response.body) as Map;

    if(!codes.contains(response .statusCode)){
      var error = resultat ["error"];
      throw Exception(error);
    }
    var user= User.fromJson(resultat);
    return user ;

  }


  //Recuperer user impl ===================================================
  @override
  Future<User> recupererUser(String token) async{
    var url = Uri.parse("http://127.0.0.1:8000/api/user");
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode != 200) {
      var error = jsonDecode(response.body)["error"];
      throw Exception(error);
    }

    var resultat = jsonDecode(response.body);
    var recupererUserConnecter = User.fromJson(resultat);
    return recupererUserConnecter;
  }



}

void main () async{
  var formulaire= Authentification(email: "ephraim30@gmail.com", password: "password");
  var service=BlogNetworkServiceImpl();
  var token="1|BFZ1RC5WMPXOGtLjbre50D4eNftagQJcPOW8NmNff3f8c688";
  var user= await service.recupererUser(token);
  print(user.name);
  print(user.email);

}