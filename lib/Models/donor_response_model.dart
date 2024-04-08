// To parse this JSON data, do
//
//     final donorResponseModel = donorResponseModelFromJson(jsonString);

import 'dart:convert';

DonorResponseModel donorResponseModelFromJson(String str) =>
    DonorResponseModel.fromJson(json.decode(str));

String donorResponseModelToJson(DonorResponseModel data) =>
    json.encode(data.toJson());

class DonorResponseModel {
  final String? name;
  final String? address;
  final String? blood_Group;
  final String? image;

  DonorResponseModel({this.name, this.address, this.blood_Group, this.image});

  factory DonorResponseModel.fromJson(Map<String, dynamic> json) =>
      DonorResponseModel(
        name: json["name"],
        address: json["address"],
        blood_Group: json["blood_group"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "blood_group": blood_Group,
        "image": image,
      };
}
