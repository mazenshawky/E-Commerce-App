import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/auth/domain/usecases/login_usecase.dart';
import 'package:e_commerce_app/modules/auth/presentation/common/freezed_data_classes.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/entities/user.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState>
    with LoginCubitInputs, LoginCubitOutputs {
  final LoginUseCase loginUseCase;

  LoginCubit({required this.loginUseCase}) : super(LoginInitial());

  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController _passwordVisibilityStreamController =
      StreamController<bool>.broadcast();

  var loginObject = LoginObject(username: '', password: '');

  // inputs
  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputChangePasswordVisibility =>
      _passwordVisibilityStreamController.sink;

  @override
  void setUsername(String username) {
    inputUsername.add((username));
    loginObject = loginObject.copyWith(username: username);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setPassword(String password) {
    inputPassword.add((password));
    loginObject = loginObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  void changePasswordVisibility(bool state) => state
      ? _passwordVisibilityStreamController.add(false)
      : _passwordVisibilityStreamController.add(true);

  @override
  void login() async {
    emit(LoginLoading());
    Either<Failure, User> response = await loginUseCase(UserModel(
      username: loginObject.username,
      password: loginObject.password,
    ));

    emit(response.fold(
      (failure) => LoginError(message: Constants.mapFailureToMsg(failure)),
      (user) => LoginSuccess(user: user),
    ));
  }

  // outputs
  @override
  Stream<bool> get outIsUsernameValid => _usernameStreamController.stream
      .map((username) => Constants.isTextValid(username));

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => Constants.isPasswordValid(password));

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => Constants.areAllLoginInputsValid(loginObject));

  @override
  Stream<bool> get outIsPasswordVisible =>
      _passwordVisibilityStreamController.stream.map((state) => state);
}

abstract class LoginCubitInputs {
  void setUsername(String username);

  void setPassword(String password);

  void changePasswordVisibility(bool state);

  void login();

  Sink get inputUsername;

  Sink get inputPassword;

  Sink get inputAreAllInputsValid;

  Sink get inputChangePasswordVisibility;
}

abstract class LoginCubitOutputs {
  Stream<bool> get outIsUsernameValid;

  Stream<bool> get outIsPasswordValid;

  Stream<bool> get outAreAllInputsValid;

  Stream<bool> get outIsPasswordVisible;
}
