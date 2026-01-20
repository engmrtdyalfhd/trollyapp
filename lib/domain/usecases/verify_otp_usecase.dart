// lib/domain/usecases/verify_otp_usecase.dart

import 'package:trollyapp/data/datasources/repositories/auth_repository.dart';

import '../entities/user.dart';
// import '../repositories/auth_repository.dart';

class VerifyOtpUseCase {
  final AuthRepository repository;

  VerifyOtpUseCase(this.repository);

  Future<User> call({required String otp}) {
    return repository.verifyOtp(otp: otp);
  }
}
