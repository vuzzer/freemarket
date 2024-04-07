part of 'link_store_bloc.dart';

@freezed
class LinkStoreState with _$LinkStoreState {
  const factory LinkStoreState(
          {required String link,
          required bool loading,
          required Either<CryptoError, Success> successOrFailure}) =
      _LinkStoreState;

  factory LinkStoreState.initial() => LinkStoreState(
      link: "", loading: false, successOrFailure: right(Success()));
}
