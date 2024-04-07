import 'package:dartz/dartz.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/data/datasource/firebase/link_store_data.dart';
import 'package:defi/domain/repositories/link-store/link_store_repo.dart';

class LinkStoreRepoImpl implements LinkStoreRepo {
  final LinkStoreData linkStoreData;

  LinkStoreRepoImpl(this.linkStoreData);

  @override
  Future<Either<Failure, String>> getLinkStoreToShare() async {
    try {
      final link = await linkStoreData.getLinkStoreToShare();
      return right(link);
    } on NetworkException {
      return left(InterneFailure());
    }
  }
}
