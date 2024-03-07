import 'package:equatable/equatable.dart';

class ActiveNotification extends Equatable {
  final int count;

  const ActiveNotification(this.count);

  @override
  List<Object?> get props => [count];
}
