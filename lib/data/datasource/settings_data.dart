import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsData {
  Future<void> language(String locale);
}

class SettingsDataImpl implements SettingsData {
  // Set language of app
  @override
  Future<void> language(String locale) async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('language')) {
      
    } else {
      await preferences.setString('language', locale);
    }
  }
}
