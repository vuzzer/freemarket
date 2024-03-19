import 'package:defi/core/enum.dart';
import 'package:defi/domain/repositories/brightness/brightness_repo.dart';

class BrightnessUsecases {
  final BrightnessRepo brightnessRepo;

  BrightnessUsecases(this.brightnessRepo);

  Future<Mode> getBrightness() {
    return brightnessRepo.getBrightness();
  }

  Future<void> changeBrightness() {
    return brightnessRepo.changeBrightness();
  }
}
