abstract class ConfigurationServiceRepository {
  Future<void> setMnemonic(String? value);
  Future<void> setupDone(bool value);
  Future<void> setPrivateKey(String? value);
  String? getMnemonic();
  String? getPrivateKey();
  bool didSetupWallet();
}