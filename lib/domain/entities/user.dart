// lib/domain/entities/user.dart
import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? imageUrl; // قد لا يمتلك المستخدم صورة شخصية

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, email, phone, imageUrl];
}
