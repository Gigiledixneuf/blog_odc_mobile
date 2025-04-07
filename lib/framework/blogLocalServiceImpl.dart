import 'dart:convert';

import 'package:blog_mobile/business/models/User.dart';
import 'package:blog_mobile/business/services/blogLocalService.dart';
import 'package:get_storage/get_storage.dart';

class BlogLocalServiceImpl implements BlogLocalService {

  final box = GetStorage();

  // Sauvegarder lutilisateur en local ===================================================
  @override
  Future<bool> sauvegarderUser(User user) async {
    var data = userToJson(user);
    await box.write("user", data);
    return true;
  }

  // Récupérer l'utilisateur depuis le stockage local ===================================
  @override
  Future<User> recupererUserLocal() async {
    var userJson = await box.read("user");
    if (userJson == null) {
      throw Exception("Aucun utilisateur trouvé dans le stockage local");
    }
    var user = User.fromJson(userJson);
    return user;
  }

  // Déconnecter l'utilisateur ===========================================================
  @override
  Future<bool> deconnecterUser() async {
    await box.remove("user");
    return true;
  }
}


void main() async{
  await GetStorage.init();
  BlogLocalServiceImpl service = BlogLocalServiceImpl();
  var user = await service.recupererUserLocal();
  print(user.email);
  print(user.name);
}