import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:defi/core/utils_type.dart';
import 'package:defi/domain/usecases/link-store/link_store_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'link_store_event.dart';
part 'link_store_state.dart';
part 'link_store_bloc.freezed.dart';

class LinkStoreBloc extends Bloc<LinkStoreEvent, LinkStoreState> {
  final LinkStoreUsecase linkStoreUsecase;
  LinkStoreBloc(this.linkStoreUsecase) : super(LinkStoreState.initial()) {
    on<LinkStoreEvent>((event, emit) async {
      await event.map(getLinkStoreToShare: (value) async {
        // Active loading
        emit(state.copyWith(loading: true));
        final response = await linkStoreUsecase.getLinkStoreToShare();

        response.fold(
            (e) => emit(state.copyWith(
                loading: false,
                successOrFailure:
                    left(CryptoError("Une erreur s'est produite")))),
            (link) => emit(state.copyWith(
                loading: false,
                link: link,
                successOrFailure:
                    right(Success())
                    )));
      });
    });
  }
}
