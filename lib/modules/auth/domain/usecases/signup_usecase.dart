import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/auth/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../repository/auth_repository.dart';

class SignupUseCase implements BaseUseCase<void, SignupRequest> {
  final AuthRepository authRepository;

  SignupUseCase({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(SignupRequest signupRequest) async {
    return await authRepository.signup(signupRequest);
  }
}

class SignupRequest extends Equatable {
  final String email;
  final String username;
  final String password;
  final Name name;
  final Address address;
  final String phone;

  const SignupRequest({
    required this.email,
    required this.username,
    required this.password,
    required this.name,
    required this.address,
    required this.phone,
  });

  @override
  List<Object?> get props => [email, username, password, name, address, phone];
}
