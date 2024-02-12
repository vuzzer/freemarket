  import 'dart:math';

int createUniqueId() {
    int random = Random().nextInt(1 << 10);
    int milliseconds = DateTime.now().millisecondsSinceEpoch;
    int idNotification = (milliseconds & 0x3FF) << 10 | random;
    return idNotification;
  }