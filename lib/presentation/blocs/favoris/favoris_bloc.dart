import 'package:bloc/bloc.dart';
import 'package:defi/domain/entities/crypto.dart';
import 'package:defi/domain/entities/favoris_crypto.dart';
import 'package:equatable/equatable.dart';

part 'favoris_event.dart';
part 'favoris_state.dart';

class FavorisBloc extends Bloc<FavorisEvent, FavorisState> {
  FavorisBloc() : super(FavorisInitial()) {
    on<FavorisEvent>((event, emit) {
      // TODO: implement event handler
      
    });
  }
}
