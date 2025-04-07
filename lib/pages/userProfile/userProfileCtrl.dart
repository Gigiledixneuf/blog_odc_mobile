
import 'package:blog_mobile/business/models/User.dart';
import 'package:blog_mobile/business/services/blogLocalService.dart';
import 'package:blog_mobile/business/services/blogNetworkService.dart';
import 'package:blog_mobile/main.dart';
import 'package:blog_mobile/pages/userProfile/userProfileState.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserProfileCtrl extends StateNotifier<UserProfileState>{

  UserProfileCtrl(): super(UserProfileState())  {
     actualiserUser();
     deconnecterUser();
  }

  var userNetworkService = getIt.get<BlogNetworkService>();
  var userLocalService = getIt.get<BlogLocalService>();

  //methode recupererUserConnected==============================================
  Future<void> recuperUser(User user)async{
    var user= await userLocalService.recupererUserLocal();
    state= state.copyWith(user: user);
  }

  //methode actualiserUserProfilPage ===========================================
  Future<void> actualiserUser()async {
    state= state.copyWith(isLoading: true);
    var user= await userLocalService.recupererUserLocal();
    var token = user.token;

    var new_user= await userNetworkService.recupererUser(token).then((e)=>{
    state= state.copyWith(isLoading: false, user: e)
    });
  }

  //methode deconnecterUser ====================================================
  Future<void> deconnecterUser(User user) async {
    state= state.copyWith(isLoading: true);
    await userLocalService.deconnecterUser();
    state= state.copyWith(isLoading: false);
  }
}

final UserProfileCtrlProvider = StateNotifierProvider<UserProfileCtrl, UserProfileState>((ref){
  return UserProfileCtrl();
});