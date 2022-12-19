import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

var logger = Logger(printer: PrettyPrinter());

class Alchemy {
  final String alchemyUrl =
      "https://eth-goerli.g.alchemy.com/v2/6177zYrp-z7vqI_Xeb93HmQzuAlBgqqP";
  final String wsUrl =
      "wss://eth-goerli.g.alchemy.com/v2/6177zYrp-z7vqI_Xeb93HmQzuAlBgqqP";
  final httpClient = Client();
  late Web3Client ethClient;
  Alchemy() {
    ethClient = Web3Client(
      alchemyUrl,
      httpClient,
      socketConnector: () {
        return IOWebSocketChannel.connect(wsUrl).cast<String>();
      },
    );
  }

  Future<void> getBalance(EthereumAddress address) async {
    //ethClient.sendTransaction(cred, transaction)
    EtherAmount amount = await ethClient.getBalance(address);
    //logger.d(amount.getValueInUnit(EtherUnit.ether));
  }
}
