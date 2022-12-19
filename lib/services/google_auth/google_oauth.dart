import 'package:defi/presentation/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class GoogleOAuth {
  static final googleSignIn = GoogleSignIn();
  //GoogleSignInAccount _user;

  //GoogleSignInAccount get user => _user;

  static Future<User?> googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    // Credential user
    User? user = userCredential.user;
    //Provider User
    //UserProvider().setUser(user);
    // Firebase storage
    //await AuthentificationServices(uid: user.uid).saveUser(user);
    //notifyListeners();
    return user;
  }

  static Future googleLogOut() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
