
import 'package:blog_mobile/business/models/User.dart';

class UserProfileState {
  User? user;
  bool? isLoading;

  UserProfileState({
    this.user,
    this.isLoading
  });

  UserProfileState copyWith({
    User? user,
    bool? isLoading
  }) =>
      UserProfileState(
        user: user ?? this.user,
        isLoading: isLoading?? this.isLoading
      );
}
