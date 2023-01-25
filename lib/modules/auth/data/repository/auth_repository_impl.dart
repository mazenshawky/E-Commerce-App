import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/auth/data/datasources/auth_remote_data_source.dart';
import 'package:e_commerce_app/modules/auth/domain/entities/user.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/auth/domain/repository/auth_repository.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.networkInfo,
    required this.authRemoteDataSource,
  });

  @override
  Future<Either<Failure, User>> getProfile(UserParameters parameters) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteProductDetails =
            await authRemoteDataSource.getProfile(parameters);
        return Right(remoteProductDetails);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }
}
