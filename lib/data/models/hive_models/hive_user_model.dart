import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hive_user_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class UserModel {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String username;
  @HiveField(3)
  String email;
  @HiveField(4)
  Address address;
  @HiveField(5)
  String phone;
  @HiveField(6)
  String website;
  @HiveField(7)
  Company company;

  UserModel(
    this.id,
    this.name,
    this.username,
    this.email,
    this.address,
    this.phone,
    this.website,
    this.company,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable()
class Address {
  @HiveField(0)
  String street;
  @HiveField(1)
  String suite;
  @HiveField(2)
  String city;
  @HiveField(3)
  String zipcode;
  @HiveField(4)
  Geo geo;

  Address(
    this.street,
    this.suite,
    this.city,
    this.zipcode,
    this.geo,
  );

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@HiveType(typeId: 2)
@JsonSerializable()
class Company {
  @HiveField(0)
  String name;
  @HiveField(1)
  String catchPhrase;
  @HiveField(2)
  String bs;

  Company(this.name, this.catchPhrase, this.bs);

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@HiveType(typeId: 3)
@JsonSerializable()
class Geo {
  @HiveField(0)
  String lat;
  @HiveField(1)
  String lng;

  Geo(this.lat, this.lng);

  factory Geo.fromJson(Map<String, dynamic> json) => _$GeoFromJson(json);

  Map<String, dynamic> toJson() => _$GeoToJson(this);
}
