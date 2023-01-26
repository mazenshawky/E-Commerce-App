// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignupObject {
  String get firstname => throw _privateConstructorUsedError;
  String get lastname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get zipCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignupObjectCopyWith<SignupObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupObjectCopyWith<$Res> {
  factory $SignupObjectCopyWith(
          SignupObject value, $Res Function(SignupObject) then) =
      _$SignupObjectCopyWithImpl<$Res, SignupObject>;
  @useResult
  $Res call(
      {String firstname,
      String lastname,
      String email,
      String phone,
      String username,
      String password,
      String city,
      String street,
      String zipCode});
}

/// @nodoc
class _$SignupObjectCopyWithImpl<$Res, $Val extends SignupObject>
    implements $SignupObjectCopyWith<$Res> {
  _$SignupObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
    Object? email = null,
    Object? phone = null,
    Object? username = null,
    Object? password = null,
    Object? city = null,
    Object? street = null,
    Object? zipCode = null,
  }) {
    return _then(_value.copyWith(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpObjectCopyWith<$Res>
    implements $SignupObjectCopyWith<$Res> {
  factory _$$_SignUpObjectCopyWith(
          _$_SignUpObject value, $Res Function(_$_SignUpObject) then) =
      __$$_SignUpObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstname,
      String lastname,
      String email,
      String phone,
      String username,
      String password,
      String city,
      String street,
      String zipCode});
}

/// @nodoc
class __$$_SignUpObjectCopyWithImpl<$Res>
    extends _$SignupObjectCopyWithImpl<$Res, _$_SignUpObject>
    implements _$$_SignUpObjectCopyWith<$Res> {
  __$$_SignUpObjectCopyWithImpl(
      _$_SignUpObject _value, $Res Function(_$_SignUpObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstname = null,
    Object? lastname = null,
    Object? email = null,
    Object? phone = null,
    Object? username = null,
    Object? password = null,
    Object? city = null,
    Object? street = null,
    Object? zipCode = null,
  }) {
    return _then(_$_SignUpObject(
      firstname: null == firstname
          ? _value.firstname
          : firstname // ignore: cast_nullable_to_non_nullable
              as String,
      lastname: null == lastname
          ? _value.lastname
          : lastname // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      zipCode: null == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpObject implements _SignUpObject {
  _$_SignUpObject(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.phone,
      required this.username,
      required this.password,
      required this.city,
      required this.street,
      required this.zipCode});

  @override
  final String firstname;
  @override
  final String lastname;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String username;
  @override
  final String password;
  @override
  final String city;
  @override
  final String street;
  @override
  final String zipCode;

  @override
  String toString() {
    return 'SignupObject(firstname: $firstname, lastname: $lastname, email: $email, phone: $phone, username: $username, password: $password, city: $city, street: $street, zipCode: $zipCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpObject &&
            (identical(other.firstname, firstname) ||
                other.firstname == firstname) &&
            (identical(other.lastname, lastname) ||
                other.lastname == lastname) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, firstname, lastname, email,
      phone, username, password, city, street, zipCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpObjectCopyWith<_$_SignUpObject> get copyWith =>
      __$$_SignUpObjectCopyWithImpl<_$_SignUpObject>(this, _$identity);
}

abstract class _SignUpObject implements SignupObject {
  factory _SignUpObject(
      {required final String firstname,
      required final String lastname,
      required final String email,
      required final String phone,
      required final String username,
      required final String password,
      required final String city,
      required final String street,
      required final String zipCode}) = _$_SignUpObject;

  @override
  String get firstname;
  @override
  String get lastname;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get username;
  @override
  String get password;
  @override
  String get city;
  @override
  String get street;
  @override
  String get zipCode;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpObjectCopyWith<_$_SignUpObject> get copyWith =>
      throw _privateConstructorUsedError;
}
