import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  final GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: ['https://www.googleapis.com/auth/tasks']);

  String _token;

  Future<String> get token async {
    if (_token == null) return await login();
    return _token;
  }

  Future<String> login() async {
    GoogleSignInAccount googleSignInAccount = await this.googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    _token = googleSignInAuthentication.accessToken;
    return _token;
  }

  Future<String> refreshToken() async {
    final GoogleSignInAccount googleSignInAccount =
        await googleSignIn.signInSilently();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    _token = googleSignInAuthentication.accessToken;
    return _token;
  }
}
