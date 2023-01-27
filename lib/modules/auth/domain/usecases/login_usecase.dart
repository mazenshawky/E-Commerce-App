import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/auth/data/models/user_model.dart';
import 'package:e_commerce_app/modules/auth/domain/entities/user.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../repository/auth_repository.dart';

class LoginUseCase implements BaseUseCase<User, UserModel> {
  final AuthRepository authRepository;

  LoginUseCase({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserModel loginRequest) async {
    return await authRepository.login(loginRequest);
  }
}
