import 'package:flutter_learn_shop/constants/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  Future<SharedPreferences> _getInstance() {
    return SharedPreferences.getInstance();
  }

  String _token = "";

  Future<void> init() async {
    final prefs = await _getInstance();
    _token = prefs.getString(GlobalConstants.TOKEN_KEY) ?? "";
  }

  String getToken() {
    return _token;
  }

  Future<void> setToken(String token) async {
    final prefs = await _getInstance();
    await prefs.setString(GlobalConstants.TOKEN_KEY, token);
    _token = token;
  }

  void removeToken() {
    _getInstance().then((prefs) {
      prefs.remove(GlobalConstants.TOKEN_KEY);
      _token = "";
    });
  }
}

final TokenManager tokenManager = TokenManager();
