
import 'package:blog_mobile/business/models/User.dart';
import 'package:blog_mobile/business/services/blogLocalService.dart';
import 'package:blog_mobile/business/services/blogNetworkService.dart';
import 'package:blog_mobile/main.dart';
import 'package:blog_mobile/pages/userProfile/userProfileState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileCtrl extends StateNotifier<UserProfileState>{
  var userNetworkService = getIt.get<BlogNetworkService>();
  var userLocalService = getIt.get<BlogLocalService>();

  UserProfileCtrl(): super(UserProfileState()) {
    // Ici, on pourrait ajouter une logique d'initialisation si nécessaire
  }

  Future<void> recuperUser(int userId)async{

  }

  Future<void> deconnecterUser(int userId)async{

  }

}