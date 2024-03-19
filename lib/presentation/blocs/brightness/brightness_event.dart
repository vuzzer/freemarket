part of 'brightness_bloc.dart';

@freezed
class BrightnessEvent with _$BrightnessEvent {
  const factory BrightnessEvent.getBrightness() = GetBrightness;
  const factory BrightnessEvent.changeBrightness() = ChangeBrightness;
}