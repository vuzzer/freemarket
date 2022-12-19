import 'package:defi/services/verification_otp/email_otp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';

var logger = Logger();
void main() {
  group("Email OTP", () {
    EmailOTP.init();
    test("Should return the balance of smart contract", () async {
      await EmailOTP.sendOTP("parfaitkouess@gmail.com");
    });
  });
}
