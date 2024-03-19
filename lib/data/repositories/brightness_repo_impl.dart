import 'package:defi/core/enum.dart';
import 'package:defi/data/datasource/brightness_data.dart';
import 'package:defi/domain/repositories/brightness/brightness_repo.dart';

class BrightnessRepoImpl implements BrightnessRepo {
  final BrightnessData brightnessData;

  BrightnessRepoImpl(this.brightnessData);

  @override
  Future<Mode> getBrightness() async {
    final mode = await brightnessData.getBrightness();
    return mode;
  }

  @override
  Future<void> changeBrightness() async {
    await brightnessData.changeBrightness();
  }
}
