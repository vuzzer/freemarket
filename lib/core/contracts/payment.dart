import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart' show join, dirname;
import 'package:web3dart/web3dart.dart';

class Payment {
  //static final File abiFile = File(join(dirname(Platform.script.path), "..", "abi", "abi.json"));
  //static final File adrFile = File(join(dirname(Platform.script.path), "..", "addresses", "payment.json"));

  late DeployedContract contract;

  Payment() {
    init();
  }

  init() async {
    final abi = await getAbi();
    final adr = await getAdr();
    contract = DeployedContract(ContractAbi.fromJson(abi, "Payment"), adr);
  }

  static Future<EthereumAddress> getAdr() async {
    //final adrString = await adrFile.readAsString();
    File adrFile = File(join(dirname(Platform.script.path), "lib",
        "domain", "addresses", "payment.json"));
    final adrStr = await adrFile.readAsString();
    final jsonAdr = jsonDecode(adrStr);
    final adr = EthereumAddress.fromHex(jsonAdr["Payment"]);
    return adr;
  }

  static Future<String> getAbi() async {
    File abiFile = File(join(
        dirname(Platform.script.path), "lib", "domain", "abi", "abi.json"));
    final abi = await abiFile.readAsString();
    return abi;
  }
}
