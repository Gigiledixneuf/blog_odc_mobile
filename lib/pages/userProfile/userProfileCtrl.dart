
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

  Future<void> recuperUser(User user)async{
    var user= await userLocalService.recupererUserLocal();
    state= state.copyWith(user: user);
  }

  Future<void> actualiserUser(User user)async {

    state= state.copyWith(isLoading: true);
    var user= await userLocalService.recupererUserLocal();
    var new_user= await userNetworkService.recupererUser(user.token?? "");
    state= state.copyWith(isLoading: false, user: new_user);

  }


  Future<void> deconnecterUser(User user) async {
    state= state.copyWith(isLoading: true);

    var user= await userLocalService.deconnecterUser();

    state= state.copyWith(isLoading: false);
  }

}