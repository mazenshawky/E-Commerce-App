// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class SignupObject with _$SignupObject {
  factory SignupObject({
    required String firstname,
    required String lastname,
    required String email,
    required String phone,
    required String username,
    required String password,
    required String city,
    required String street,
    required String zipCode,
  }) = _SignUpObject;
}
