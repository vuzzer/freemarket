import 'package:dartz/dartz.dart';
import 'package:defi/core/error/failure.dart';
import 'package:defi/core/params.dart';
import 'package:defi/domain/entities/token_market_data.dart';
import 'package:defi/domain/repositories/market/token_market_repo.dart';

class TokenMarketUsecase {
  final TokenMarketRepository tokenMarketRepository;

  TokenMarketUsecase(this.tokenMarketRepository);

  Future<Either<Failure, TokenMarketData>> getTokenPrice(Params params) {
    return tokenMarketRepository.getPriceToken(params);
  }
}


