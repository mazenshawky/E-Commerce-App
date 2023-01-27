import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? email;
  final String? username;
  final String? password;
  final Name? name;
  final Address? address;
  final String? phone;

  const User({
    this.id,
    this.email,
    this.username,
    this.password,
    this.name,
    this.address,
    this.phone,
  });

  @override
  List<Object?> get props =>
      [id, email, username, password, name, address, phone];
}

class Name extends Equatable {
  final String firstname;
  final String lastname;

  const Name({required this.firstname, required this.lastname});

  @override
  List<Object?> get props => [firstname, lastname];
}

class Address extends Equatable {
  final String city;
  final String street;
  final String zipCode;
  final GeoLocation? geoLocation;

  const Address({
    required this.city,
    required this.street,
    required this.zipCode,
    this.geoLocation,
  });

  @override
  List<Object?> get props => [city, street, zipCode, geoLocation];
}

class GeoLocation extends Equatable {
  final String lat;
  final String long;

  const GeoLocation({required this.lat, required this.long});

  @override
  List<Object?> get props => [lat, long];
}
