import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';

@freezed
class AppUser with _$AppUser {

  factory AppUser({
    String? userId,
    String? imageUrl,
    String? name,
    String? email
  }) = _AppUser;

  factory AppUser.from(User? user){
    return AppUser(
      userId: user?.uid,
      imageUrl: user?.photoURL,
      name: user?.displayName,
      email: user?.email
    );
  }
}