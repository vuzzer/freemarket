import 'package:bloc/bloc.dart';
import 'package:defi/core/enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'brightness_event.dart';
part 'brightness_state.dart';
part 'brightness_bloc.freezed.dart';

class BrightnessBloc extends Bloc<BrightnessEvent, BrightnessState> {
  BrightnessBloc() : super( BrightnessState.initial() ) {
    on<BrightnessEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
