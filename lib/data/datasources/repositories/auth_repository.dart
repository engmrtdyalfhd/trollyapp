// lib/domain/repositories/auth_repository.dart

// import '../entities/user.dart';

import 'package:trollyapp/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> login({required String email, required String password});

  Future<User> verifyOtp({required String otp});
}
