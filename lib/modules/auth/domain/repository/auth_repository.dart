import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/auth/data/models/user_model.dart';
import 'package:e_commerce_app/modules/auth/domain/entities/user.dart';

import '../../../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> signup(UserModel signupRequest);

  Future<Either<Failure, User>> getProfile(UserParameters parameters);

  void cacheLoggedUser({required int userId});
}
