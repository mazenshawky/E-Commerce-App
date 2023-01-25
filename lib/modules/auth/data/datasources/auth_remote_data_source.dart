import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/modules/auth/data/models/user_model.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  Future<User> getProfile(UserParameters parameters);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<User> getProfile(UserParameters parameters) async {
    final response =
        await apiConsumer.get(EndPoints.userProfilePath(parameters.userId));

    return UserModel.fromJson(response);
  }
}
