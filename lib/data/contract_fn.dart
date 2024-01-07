import 'package:defi/data/rpcnode/alchemy.dart';
import 'package:defi/core/contracts/payment.dart';
import 'package:web3dart/web3dart.dart';

/*
contract Payment
  |__ owner
  |__ getContractBalance()
  |__ payOwner()
 */

class ContractFn {
  final Alchemy alchemy = Alchemy();
  final Payment payment = Payment();

  Future<dynamic> getContractBalance(Credentials credential) async {
    final getFunction = payment.contract.function('getContractBalance');
    final output = await alchemy.ethClient.call(
       
            contract: payment.contract, function: getFunction, params: []);
    return output;
  }
}
