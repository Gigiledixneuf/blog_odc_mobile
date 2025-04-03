import 'package:blog_mobile/business/models/Authentication.dart';
import 'package:blog_mobile/business/models/User.dart';

abstract class BlogNetworkService{
  Future<User>authentifier(Authentification data);
  Future<User> recupererUser(String token);

}