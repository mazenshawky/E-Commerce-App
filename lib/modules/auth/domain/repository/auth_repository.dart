import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/auth/domain/entities/user.dart';

import '../../../../core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> getProfile();
}
