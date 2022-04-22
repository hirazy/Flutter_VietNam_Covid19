import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:line_icons/line_icon.dart';

import '../auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;

class AuthRepositoryImpl extends AuthRepository {

  @override
  Future<void> login(String username, String password) {

    throw UnimplementedError();

    FirebaseAuth auth = FirebaseAuth.instance;

  }

  @override
  Future<void> authenticate(String username, String password, String url) {
    // TODO: implement authenticate
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> signup(String username, String password) {
    // TODO: implement signup
    throw UnimplementedError();
  }


  // final Reader _reader;
  //
  // late final firebase.FirebaseAuth _firebaseAuth =
  // _reader(firebaseAuthProvider);


  // @override
  // Future<firebase.User> login(String username, String password) async {
  //   final account = await GoogleSignIn().signIn();
  //   if (account == null) {}
  //
  //   final auth = await account!.authentication;
  //
  //   final authCredential = firebase.GoogleAuthProvider.credential(
  //       idToken: auth.idToken, accessToken: auth.accessToken);
  //
  //   final credential = await _firebaseAuth
  //
  // }
}
