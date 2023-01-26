import 'package:e_commerce_app/core/api/end_points.dart';
import 'package:e_commerce_app/modules/auth/data/models/user_model.dart';
import 'package:e_commerce_app/modules/auth/domain/usecases/signup_usecase.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/usecases/base_usecase.dart';
import '../../domain/entities/user.dart';

abstract class AuthRemoteDataSource {
  Future<User> signup(SignupRequest signupRequest);

  Future<User> getProfile(UserParameters parameters);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  ApiConsumer apiConsumer;

  AuthRemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<User> signup(SignupRequest signupRequest) async {
    final response = await apiConsumer.post(
      EndPoints.signupPath,
      body: {
        'email': signupRequest.email,
        'username': signupRequest.username,
        'password': signupRequest.password,
        'name': {
          'firstname': signupRequest.name.firstname,
          'lastname': signupRequest.name.lastname
        },
        'address': {
          'city': signupRequest.address.city,
          'street': signupRequest.address.street,
          'zipcode': signupRequest.address.zipCode,
        },
        'phone': signupRequest.phone
      },
    );

    return UserModel.signupFromJson(response);
  }

  @override
  Future<User> getProfile(UserParameters parameters) async {
    final response =
        await apiConsumer.get(EndPoints.userProfilePath(parameters.userId));

    return UserModel.profileFromJson(response);
  }
}
