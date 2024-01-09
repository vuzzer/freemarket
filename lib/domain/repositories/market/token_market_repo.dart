import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/core/params.dart';
import 'package:defi/domain/entities/token_market_data.dart';

abstract class TokenMarketRepository {
  Future<Either<Failure, TokenMarketData>> getPriceToken(Params token);
}
