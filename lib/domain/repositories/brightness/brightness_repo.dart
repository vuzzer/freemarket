import 'package:defi/core/enum.dart';

abstract class BrightnessRepo {
  Future<Mode> getBrightness();
  Future<void> changeBrightness();
}