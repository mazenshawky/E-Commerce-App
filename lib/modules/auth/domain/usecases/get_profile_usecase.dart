import 'package:e_commerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/auth/domain/entities/user.dart';
import 'package:e_commerce_app/modules/auth/domain/repository/auth_repository.dart';

class GetProfileUseCase implements BaseUseCase<User, UserParameters> {
  final AuthRepository authRepository;

  GetProfileUseCase({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserParameters parameters) async {
    return await authRepository.getProfile(parameters);
  }
}
