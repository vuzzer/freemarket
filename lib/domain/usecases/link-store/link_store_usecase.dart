import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/domain/repositories/link-store/link_store_repo.dart';

class LinkStoreUsecase {
  final LinkStoreRepo linkStoreRepo;
  LinkStoreUsecase(this.linkStoreRepo);

  Future<Either<Failure, String>> getLinkStoreToShare() {
    return linkStoreRepo.getLinkStoreToShare();
  }
}
