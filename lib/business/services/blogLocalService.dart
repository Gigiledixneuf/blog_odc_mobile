import 'package:blog_mobile/business/models/User.dart';

abstract class BlogLocalService{
  Future<bool>sauvegarderUser(User user);
  Future<bool> deconnecterUser();
  Future<User> recupererUserLocal();
}