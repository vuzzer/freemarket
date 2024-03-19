part of 'brightness_bloc.dart';

@freezed
class BrightnessState with _$BrightnessState {
  const factory BrightnessState({required Mode brightness}) = _BrightnessState;
  factory BrightnessState.initial() => const BrightnessState(brightness: Mode.dark);
}
