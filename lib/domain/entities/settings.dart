import 'package:equatable/equatable.dart';

class Settings extends Equatable {
  final String visible; // Indicate crypto visible
  final List<String> favoris; // Favoris crypto of user
  final List<String> notification;

  const Settings(
      {required this.visible,
      required this.favoris,
      required this.notification});

  @override
  // TODO: implement props
  List<Object?> get props =>
      [visible, favoris, notification]; // List of crypto that we want notify
}
