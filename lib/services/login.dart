import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  final GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: ['https://www.googleapis.com/auth/tasks']);

  String token;

  String get t => t == null ? login() : token;

  Future<String> login() async {
    GoogleSignInAccount googleSignInAccount;
    try {
      googleSignInAccount = await this.googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
    print('$googleSignInAccount');

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    print('$googleSignInAuthentication');

    token = googleSignInAuthentication.accessToken;

    return token;
  }
}
