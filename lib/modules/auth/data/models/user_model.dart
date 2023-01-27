import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    super.id,
    super.token,
    super.email,
    super.username,
    super.password,
    super.name,
    super.address,
    super.phone,
  });

  factory UserModel.profileFromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json['email'],
        username: json['username'],
        name: NameModel.fromJson(json['name']),
        address: AddressModel.fromJson(json['address']),
        phone: json['phone'],
      );

  factory UserModel.signupFromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
      );

  factory UserModel.loginFromJson(Map<String, dynamic> json) => UserModel(
        token: json['token'],
      );

  Map<String, dynamic> signupToJson() => {
        'email': email,
        'username': username,
        'password': password,
        'name': {
          'firstname': name!.firstname,
          'lastname': name!.lastname,
        },
        'address': {
          'city': address!.city,
          'street': address!.street,
          'zipcode': address!.zipCode,
        },
        'phone': phone,
      };

  Map<String, dynamic> loginToJson() => {
        'username': username,
        'password': password,
      };
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
    super.geoLocation,
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
