import 'package:blog_mobile/business/services/blogLocalService.dart';
import 'package:blog_mobile/business/services/blogNetworkService.dart';
import 'package:blog_mobile/framework/blogLocalServiceImpl.dart';
import 'package:blog_mobile/framework/blogNetworkServiceImpl.dart';
import 'package:blog_mobile/pages/UserProfile/userProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';

var getIt= GetIt.instance;

void setup(){
  getIt.registerLazySingleton<BlogNetworkService>((){
    return BlogNetworkServiceImpl();
  });

  getIt.registerLazySingleton<BlogLocalService>((){
    return BlogLocalServiceImpl();
  });
}

void main() async{
  setup();
  await GetStorage.init();
  runApp(ProviderScope(child: Myapp()));
}

class Myapp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UserProfilePage(),
      debugShowCheckedModeBanner: false,
    );
  }

}