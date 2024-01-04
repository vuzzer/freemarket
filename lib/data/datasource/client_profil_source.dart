import 'package:defi/core/database/client_profil_collection.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/data/models/client_profil_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class ClientProfilDataSource {
  /// Throws [UserException]
  Future<ClientProfilModel> login();
  Future<ClientProfilModel> register();
  Future<bool> logout();
}

class ClientProfilDataSourceImpl implements ClientProfilDataSource {
  @override
  Future<ClientProfilModel> login() async {
    // Object to Sign In using google account
    final googleSignIn = GoogleSignIn();

    // Sign In an account, otherwise an error is throws
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) throw FailedLoginException();

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    // Sign in account into Firebase
    UserCredential userCredential =
    await FirebaseAuth.instance.signInWithCredential(credential);

    // signed-in users info
    final clientProfil = await ClientProfilCollection().getUser(userCredential.user!.uid);

    return clientProfil;
  }

  @override
  Future<bool> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<ClientProfilModel> register() {
    // TODO: implement register
    throw UnimplementedError();
  }
}
