import 'package:defi/helpers/enum.dart';
import '../../domain/entities/network_type.dart';

class AppConfig {
  static Map<NetworkType, AppConfigParams> networks =
      <NetworkType, AppConfigParams>{
    NetworkType.Local: AppConfigParams(
      'http://192.168.40.197:8545',
      '0xD933a953f4786Eed5E58D234dFeadE15c96bAa8b',
      web3RdpUrl: 'ws://192.168.40.197:8545',
      symbol: 'ETH',
      icon: 'eth',
      faucetUrl: 'about:blank',
      enabled: false,
      value: Blockchain.ethereum,
      label: 'Local (Truffle)',
      id: "local"
    ),
    NetworkType.Ethereum: AppConfigParams(
      'https://goerli.infura.io/v3/628074215a2449eb960b4fe9e95feb09',
      '0x3B4c8de78c34773f5A1A656691734641f99066A1',
      symbol: 'ETH',
      icon: 'eth',
      faucetUrl: 'https://goerlifaucet.com',
      enabled: true,
      value: Blockchain.ethereum,
      label: 'Ethereum (Goerli)',
      id: "ethereum"
    ),
    NetworkType.BSC: AppConfigParams(
      'https://data-seed-prebsc-1-s1.binance.org:8545',
      '0x73434bb95eC80d623359f6f9d7b84568407187BA',
      symbol: 'BNB',
      icon: 'bnb',
      faucetUrl: 'https://testnet.binance.org/faucet-smart',
      enabled: true,
      value: Blockchain.bsc,
      label: 'Binance Chain (BSC)',
      id: "binancecoin"
    ),
    NetworkType.Matic: AppConfigParams(
      'https://rpc-mumbai.maticvigil.com',
      '0x73434bb95eC80d623359f6f9d7b84568407187BA',
      web3RdpUrl: 'wss://ws-mumbai.matic.today',
      symbol: 'MATIC',
      icon: 'matic',
      faucetUrl: 'https://faucet.matic.network',
      enabled: true,
      value: Blockchain.matic,
      label: 'Matic (Mumbai)',
      id: "aave-polygon-wmatic"
    )
  };
}

class AppConfigParams {
  final String? web3RdpUrl;
  final String web3HttpUrl;
  final String contractAddress;
  final String symbol;
  final String faucetUrl;
  final bool enabled;
  final String label;
  final String icon;
  final Blockchain value; //use for radio button
  final String id;
  AppConfigParams(
    this.web3HttpUrl,
    this.contractAddress, {
    required this.symbol,
    required this.faucetUrl,
    required this.enabled,
    required this.label,
    required this.icon,
    required this.value,
    this.web3RdpUrl,
    required this.id,
  });
}
