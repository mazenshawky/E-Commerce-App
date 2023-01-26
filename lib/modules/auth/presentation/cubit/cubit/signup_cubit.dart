import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/modules/auth/domain/entities/user.dart';
import 'package:e_commerce_app/modules/auth/domain/usecases/signup_usecase.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../../../core/utils/constants.dart';
import '../../common/freezed_data_classes.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState>
    with SignUpCubitInputs, SignUpCubitOutputs {
  final SignupUseCase signupUseCase;

  SignupCubit({required this.signupUseCase}) : super(SignupInitial());

  final StreamController _firstnameStreamController =
      StreamController<String>.broadcast();

  final StreamController _lastnameStreamController =
      StreamController<String>.broadcast();

  final StreamController _emailStreamController =
      StreamController<String>.broadcast();

  final StreamController _phoneStreamController =
      StreamController<String>.broadcast();

  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();

  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _cityStreamController =
      StreamController<String>.broadcast();

  final StreamController _streetStreamController =
      StreamController<String>.broadcast();

  final StreamController _zipCodeStreamController =
      StreamController<String>.broadcast();

  final StreamController _areAllInputsValidStreamController =
      StreamController<void>.broadcast();

  final StreamController _passwordVisibilityStreamController =
      StreamController<bool>.broadcast();

  var signupObject = SignupObject(
    firstname: '',
    lastname: '',
    email: '',
    phone: '',
    username: '',
    password: '',
    city: '',
    street: '',
    zipCode: '',
  );

  // inputs
  @override
  Sink get inputFirstname => _firstnameStreamController.sink;

  @override
  Sink get inputLastname => _lastnameStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputPhone => _phoneStreamController.sink;

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputCity => _cityStreamController.sink;

  @override
  Sink get inputStreet => _streetStreamController.sink;

  @override
  Sink get inputZipCode => _zipCodeStreamController.sink;

  @override
  Sink get inputAreAllInputsValid => _areAllInputsValidStreamController.sink;

  @override
  Sink get inputChangePasswordVisibility =>
      _passwordVisibilityStreamController.sink;

  @override
  void setFirstname(String firstname) {
    inputFirstname.add((firstname));
    signupObject = signupObject.copyWith(firstname: firstname);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setLastname(String lastname) {
    inputLastname.add((lastname));
    signupObject = signupObject.copyWith(lastname: lastname);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setEmail(String email) {
    inputEmail.add((email));
    signupObject = signupObject.copyWith(email: email);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setPhone(String phone) {
    inputPhone.add((phone));
    signupObject = signupObject.copyWith(phone: phone);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setUsername(String username) {
    inputUsername.add((username));
    signupObject = signupObject.copyWith(username: username);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setPassword(String password) {
    inputPassword.add((password));
    signupObject = signupObject.copyWith(password: password);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setCity(String city) {
    inputCity.add(city);
    signupObject = signupObject.copyWith(city: city);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setStreet(String street) {
    inputStreet.add((street));
    signupObject = signupObject.copyWith(street: street);
    inputAreAllInputsValid.add(null);
  }

  @override
  void setZipCode(String zipCode) {
    inputZipCode.add((zipCode));
    signupObject = signupObject.copyWith(zipCode: zipCode);
    inputAreAllInputsValid.add(null);
  }

  @override
  changePasswordVisibility(bool state) => state
      ? _passwordVisibilityStreamController.add(false)
      : _passwordVisibilityStreamController.add(true);

  @override
  void signup() async {
    emit(SignupLoading());
    Either<Failure, void> response = await signupUseCase(SignupParameters(
      email: signupObject.email,
      username: signupObject.username,
      password: signupObject.password,
      name: Name(
        firstname: signupObject.firstname,
        lastname: signupObject.lastname,
      ),
      address: Address(
        city: signupObject.city,
        street: signupObject.street,
        zipCode: signupObject.zipCode,
      ),
      phone: signupObject.phone,
    ));

    emit(response.fold(
      (failure) => SignupError(message: Constants.mapFailureToMsg(failure)),
      (user) => SignupSuccess(),
    ));
  }

  // outputs
  @override
  Stream<bool> get outIsFirstnameValid => _firstnameStreamController.stream
      .map((firstname) => Constants.isTextValid(firstname));

  @override
  Stream<bool> get outIsLastnameValid => _lastnameStreamController.stream
      .map((lastname) => Constants.isTextValid(lastname));

  @override
  Stream<bool> get outIsEmailValid => _emailStreamController.stream
      .map((email) => Constants.isEmailValid(email));

  @override
  Stream<bool> get outIsPhoneValid => _phoneStreamController.stream
      .map((phone) => Constants.isPhoneValid(phone));

  @override
  Stream<bool> get outIsUsernameValid => _usernameStreamController.stream
      .map((username) => Constants.isTextValid(username));

  @override
  Stream<bool> get outIsPasswordValid => _passwordStreamController.stream
      .map((password) => Constants.isPasswordValid(password));

  @override
  Stream<bool> get outIsCityValid =>
      _cityStreamController.stream.map((city) => Constants.isTextValid(city));

  @override
  Stream<bool> get outIsStreetValid => _streetStreamController.stream
      .map((street) => Constants.isTextValid(street));

  @override
  Stream<bool> get outIsZipCodeValid => _zipCodeStreamController.stream
      .map((zipCode) => Constants.isTextValid(zipCode));

  @override
  Stream<bool> get outAreAllInputsValid =>
      _areAllInputsValidStreamController.stream
          .map((_) => Constants.areAllSignUpInputsValid(signupObject));

  @override
  Stream<bool> get outIsPasswordVisible =>
      _passwordVisibilityStreamController.stream.map((state) => state);
}

abstract class SignUpCubitInputs {
  void setFirstname(String firstname);
  void setLastname(String lastname);
  void setEmail(String email);
  void setPhone(String phone);
  void setUsername(String username);
  void setPassword(String password);
  void setCity(String city);
  void setStreet(String street);
  void setZipCode(String zipCode);

  void changePasswordVisibility(bool state);

  void signup();

  Sink get inputFirstname;
  Sink get inputLastname;
  Sink get inputEmail;
  Sink get inputPhone;
  Sink get inputUsername;
  Sink get inputPassword;
  Sink get inputCity;
  Sink get inputStreet;
  Sink get inputZipCode;
  Sink get inputAreAllInputsValid;
  Sink get inputChangePasswordVisibility;
}

abstract class SignUpCubitOutputs {
  Stream<bool> get outIsFirstnameValid;
  Stream<bool> get outIsLastnameValid;
  Stream<bool> get outIsEmailValid;
  Stream<bool> get outIsPhoneValid;
  Stream<bool> get outIsUsernameValid;
  Stream<bool> get outIsPasswordValid;
  Stream<bool> get outIsCityValid;
  Stream<bool> get outIsStreetValid;
  Stream<bool> get outIsZipCodeValid;
  Stream<bool> get outAreAllInputsValid;
  Stream<bool> get outIsPasswordVisible;
}
