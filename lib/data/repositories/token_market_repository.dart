import 'package:dartz/dartz.dart';
import 'package:defi/core/error/exception.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/core/params.dart';
import 'package:defi/data/datasource/token_market_datasource.dart';
import 'package:defi/domain/entities/token_market_data.dart';
import 'package:defi/domain/repositories/market/token_market_repo.dart';

class TokenMarketRepositoryImpl implements TokenMarketRepository {
  final TokenMarketDataSource tokenMarketDataSource;
  TokenMarketRepositoryImpl(this.tokenMarketDataSource);

  @override
  Future<Either<Failure, TokenMarketData>> getPriceToken(Params token) async {
    try {
      final tokenData = await tokenMarketDataSource.getTokenPrice(token);
      return Future.value(Right(tokenData));
    } on NetworkException {
      return Left(InternetFailure());
    }
  }
}
