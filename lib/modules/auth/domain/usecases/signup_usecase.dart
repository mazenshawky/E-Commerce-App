import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/auth/data/models/user_model.dart';
import 'package:e_commerce_app/modules/auth/domain/entities/user.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../repository/auth_repository.dart';

class SignupUseCase implements BaseUseCase<void, UserModel> {
  final AuthRepository authRepository;

  SignupUseCase({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserModel signupRequest) async {
    return await authRepository.signup(signupRequest);
  }
}
