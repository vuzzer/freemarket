import 'package:defi/domain/entities/crypto.dart';
import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final CryptoInfo visible; // Indicate crypto visible
  final List<CryptoInfo> favoris; // Favoris crypto of user
  final List<CryptoInfo> notification;

  const Settings(
      {required this.visible,
      required this.favoris,
      required this.notification});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [visible, favoris, notification]; // List of crypto that we want notify
}
