import 'package:defi/core/configuration_service_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationService implements ConfigurationServiceRepository {
  const ConfigurationService(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<void> setMnemonic(String? value) async {
    await _preferences.setString('mnemonic', value ?? '');
  }

  @override
  Future<void> setPrivateKey(String? value) async {
    await _preferences.setString('privateKey', value ?? '');
  }

  @override
  Future<void> setupDone(bool value) async {
    await _preferences.setBool('didSetupWallet', value);
  }

  // gets
  @override
  String? getMnemonic() {
    return _preferences.getString('mnemonic');
  }

  @override
  String? getPrivateKey() {
    return _preferences.getString('privateKey');
  }

  @override
  bool didSetupWallet() {
    return _preferences.getBool('didSetupWallet') ?? false;
  }
}
