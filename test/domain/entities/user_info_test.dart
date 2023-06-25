import 'package:defi/domain/entities/user_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

var logger = Logger();

void main() {
  test("create a user from JSON", () {
    var data = {
      "uid": "3",
      "displayName": "legend 225 dev",
      "email": "legend@gmail.com",
      "photoUrl": "me"
    };
    
    final user = UserInfo.fromJson(data);

    logger.d(user);
  });
}
