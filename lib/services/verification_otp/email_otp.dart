import 'package:email_auth/email_auth.dart';

class EmailOTP {
  static EmailAuth emailAuth = EmailAuth(sessionName: "Test Session");
  static void init() {
    emailAuth.config({"server": "http://localhost:5000", "serverKey": "JhQ9Ze"});
  }

  static Future<bool> sendOTP(String email) async {
    bool result = await emailAuth.sendOtp(recipientMail: email, otpLength: 4);
    return result;
  }

  static Future<bool> validateOTP(String email, String otp) async {
    bool result = emailAuth.validateOtp(recipientMail: email, userOtp: otp);
    return result;
  }
}
