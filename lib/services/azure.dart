import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';

class Azure {
  AadOAuth oauth;
  String _token;

  Future<String> get token async {
    if (_token == null) await login();
    return _token;
  }

  Azure() {
    final Config config = Config(
      clientId: '130175b0-9081-4887-8422-cb7495ff8dc4',
      tenant: 'common',
      scope: 'Notes.ReadWrite User.Read offline_access',
      redirectUri: 'https://login.live.com/oauth20_desktop.srf',
    );
    oauth = AadOAuth(config);
  }

  Future login() async {
    try {
      await oauth.login();
      _token = await oauth.getAccessToken();
    } catch (e) {
      print("Well that didn't work: $e");
    }
  }
}
