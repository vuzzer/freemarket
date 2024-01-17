import 'package:dartz/dartz.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/core/network/network_info.dart';
import 'package:defi/core/params.dart';
import 'package:defi/data/datasource/token_market_datasource.dart';
import 'package:defi/domain/entities/token_market_data.dart';
import 'package:defi/domain/repositories/market/token_market_repo.dart';

class TokenMarketRepositoryImpl implements TokenMarketRepository {
  final TokenMarketDataSource tokenMarketDataSource;
  final NetworkInfo networkInfo;
  TokenMarketRepositoryImpl(
      {required this.tokenMarketDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, TokenMarketData>> getPriceToken(Params token) async {
    try {
      if (await networkInfo.isConnected) {
        final tokenData = await tokenMarketDataSource.getTokenPrice(token);
        return Future.value(Right(tokenData));
      }
      // Throw network exception
      throw NetworkException();
    } on NetworkException {
      return Left(InternetFailure());
    }
  }
}
