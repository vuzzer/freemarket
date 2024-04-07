import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:defi/core/error/exception.dart';


abstract class LinkStoreData {
  Future<String> getLinkStoreToShare();
}

class LinkStoreDataImpl implements LinkStoreData {
  @override
  Future<String> getLinkStoreToShare() async {
    try {
      final platform = Platform.isIOS ? 'Ios' : 'Android';
      final linkStoreRef = FirebaseFirestore.instance.collection('LinkStore');
      final docResults = await linkStoreRef.doc(platform).get();
      final store = docResults.data();
      return store!["link"];
    } catch (e) {
      throw NetworkException();
    }
  }
}
