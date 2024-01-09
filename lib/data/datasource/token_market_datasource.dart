import 'package:defi/core/params.dart';
import 'package:defi/data/models/token_market_data_model.dart';

abstract class TokenMarketDataSource {
  /// Throws [NetworkException]
  Future<TokenMarketDataModel> getTokenPrice(Params params);
}

class TokenMarketDataSourceImpl implements TokenMarketDataSource {
  @override
  Future<TokenMarketDataModel> getTokenPrice(Params params) {
    throw UnimplementedError();
  }
}
