import 'package:shared_preferences/shared_preferences.dart';

import '../core/utils/app_strings.dart';

abstract class AppPreferences {
  Future<bool> isUserLoggedIn();

  int getUserId();

  void logout();
}

class AppPreferencesImpl implements AppPreferences {
  final SharedPreferences sharedPreferences;

  AppPreferencesImpl({required this.sharedPreferences});

  @override
  Future<bool> isUserLoggedIn() async =>
      sharedPreferences.getBool(AppStrings.isUserLoggedInKey) ?? false;

  @override
  int getUserId() => sharedPreferences.getInt(AppStrings.userIdKey) ?? 2;

  @override
  void logout() {
    sharedPreferences.remove(AppStrings.isUserLoggedInKey);
    sharedPreferences.remove(AppStrings.userIdKey);
  }
}
