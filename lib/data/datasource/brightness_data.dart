import 'package:defi/core/enum.dart';
import 'package:defi/core/hive_box_name.dart';
import 'package:hive/hive.dart';

abstract class BrightnessData {
  Future<Mode> getBrightness();
  Future<void> changeBrightness();
}

class BrightnessDataImpl implements BrightnessData {
  static String keyBox = "darkMode";
  @override
  Future<Mode> getBrightness() async {
    var settingBox = await Hive.openBox(HiveBoxName.settingsBox);
    bool darkMode = settingBox.get(keyBox, defaultValue: true);
    await settingBox.close();
    if (darkMode) {
      return Mode.dark;
    }
    return Mode.light;
  }

  @override
  Future<void> changeBrightness() async {
    var settingBox = await Hive.openBox(HiveBoxName.settingsBox);
    bool darkMode = settingBox.get(keyBox, defaultValue: true);

    // change brightness
    await settingBox.put(keyBox, !darkMode);

    // close box
    await settingBox.close();
  }
}
