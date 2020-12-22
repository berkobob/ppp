import 'package:google_sign_in/google_sign_in.dart';

class GoogleLogin {
  final GoogleSignIn googleSignIn =
      GoogleSignIn(scopes: ['https://www.googleapis.com/auth/tasks']);

  String _token;
  //'ya29.a0AfH6SMBjztllKaLN9QJfPbxEcpQZIl7BxeIODabzqYeRQIUrZ_d3c0zNsetT96UTwEUZ3_HTTwwFSZlyCSTcKBeQeoT2nRtz6pHJC1yj_GxKWV7JObeK6Zm4Z2JxpAFFJSjknZzElCmOzqVMYmozCfMQ9bL6OIN_-wtASMUb8WE';

  Future<String> get token async {
    if (_token == null) return await refreshToken();
    return _token;
  }

  Future<String> login() async {
    GoogleSignInAccount googleSignInAccount = await this.googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    _token = googleSignInAuthentication.accessToken;
    print('token: $_token');
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
