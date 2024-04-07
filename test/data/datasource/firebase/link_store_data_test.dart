import 'package:defi/data/datasource/firebase/link_store_data.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LinkStoreDataImpl linkStoreDataImpl;

  setUpAll(() async {
    linkStoreDataImpl = LinkStoreDataImpl();
  });

  test('Should link store from firebase', () async {
    await linkStoreDataImpl.getLinkStoreToShare();
  });
}
