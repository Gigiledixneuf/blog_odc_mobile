import 'dart:convert';

import 'package:blog_mobile/business/models/User.dart';
import 'package:blog_mobile/business/services/blogLocalService.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class BlogLocalServiceImpl implements BlogLocalService{

  final box = GetStorage();

  @override
  Future<bool> sauvegarderUser(User user) async{
    var data=user.toJson();
    await box?.write("user", jsonEncode(data));
    return true;
  }

  //Deconnection User impl ===================================================
  @override
  Future<bool> deconnecterUser() async{
   await box.remove("user");
   return true;
  }

  @override
  Future<User> recupererUserLocal() {
    // TODO: implement recupererUserLocal
    throw UnimplementedError();
  }

}