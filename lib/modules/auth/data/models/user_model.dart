import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    super.id,
    required super.email,
    required super.username,
    required super.name,
    required super.address,
    required super.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
        username: json['username'],
        name: NameModel.fromJson(json['name']),
        address: AddressModel.fromJson(json['address']),
        phone: json['phone'],
      );
}

class NameModel extends Name {
  const NameModel({required super.firstname, required super.lastname});

  factory NameModel.fromJson(Map<String, dynamic> json) => NameModel(
        firstname: json['firstname'],
        lastname: json['lastname'],
      );
}

class AddressModel extends Address {
  const AddressModel({
    required super.city,
    required super.street,
    required super.zipCode,
    required super.geoLocation,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        city: json['city'],
        street: json['street'],
        zipCode: json['zipcode'],
        geoLocation: GeoLocationModel.fromJson(json['geolocation']),
      );
}

class GeoLocationModel extends GeoLocation {
  const GeoLocationModel({required super.lat, required super.long});

  factory GeoLocationModel.fromJson(Map<String, dynamic> json) =>
      GeoLocationModel(
        lat: json['lat'],
        long: json['long'],
      );
}
