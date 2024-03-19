import 'package:bloc/bloc.dart';
import 'package:defi/core/enum.dart';
import 'package:defi/domain/usecases/brightness/brightness_usecases.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brightness_event.dart';
part 'brightness_state.dart';
part 'brightness_bloc.freezed.dart';

class BrightnessBloc extends Bloc<BrightnessEvent, BrightnessState> {
  final BrightnessUsecases brightnessUsecases;

  BrightnessBloc(this.brightnessUsecases) : super(BrightnessState.initial()) {
    on<BrightnessEvent>((event, emit) async {
      await event.map(getBrightness: (value) async {
        final mode = await brightnessUsecases.getBrightness();
        emit(state.copyWith(brightness: mode));
      }, changeBrightness: (value) async {
        await brightnessUsecases.changeBrightness();
        add(const GetBrightness());
      });
    });
  }
}
