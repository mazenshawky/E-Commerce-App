import 'package:e_commerce_app/core/usecases/base_usecase.dart';
import 'package:e_commerce_app/modules/auth/data/datasources/auth_remote_data_source.dart';
import 'package:e_commerce_app/modules/auth/data/models/user_model.dart';
import 'package:e_commerce_app/modules/auth/domain/entities/user.dart';
import 'package:e_commerce_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/auth/domain/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utils/app_strings.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource authRemoteDataSource;
  final SharedPreferences sharedPreferences;

  AuthRepositoryImpl({
    required this.networkInfo,
    required this.authRemoteDataSource,
    required this.sharedPreferences,
  });

  @override
  Future<Either<Failure, User>> signup(UserModel signupRequest) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.signup(signupRequest);
        // cacheLoggedUser(userId: response.id!);
        cacheLoggedUser(userId: 2);
        return Right(response);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(InternetFailure());
    }
  }

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

  @override
  void cacheLoggedUser({required int userId}) {
    sharedPreferences.setBool(AppStrings.isUserLoggedInKey, true);
    sharedPreferences.setInt(AppStrings.userIdKey, 2);
  }
}
