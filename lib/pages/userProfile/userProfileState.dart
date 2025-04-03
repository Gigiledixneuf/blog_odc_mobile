
import 'package:blog_mobile/business/models/User.dart';

class UserProfileState {
  User? user;

  UserProfileState({
    this.user,
  });

  UserProfileState copyWith({
    User? user,
  }) =>
      UserProfileState(
        user: user ?? this.user,
      );
}
