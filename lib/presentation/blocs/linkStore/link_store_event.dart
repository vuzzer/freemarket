part of 'link_store_bloc.dart';

@freezed
class LinkStoreEvent with _$LinkStoreEvent {
  const factory LinkStoreEvent.getLinkStoreToShare() = GetLinkStoreToShare;
}