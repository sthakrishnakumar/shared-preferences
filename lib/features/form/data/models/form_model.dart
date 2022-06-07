// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FormModel {
  final String name;
  final String address;
  FormModel({
    required this.name,
    required this.address,
  });

  FormModel copyWith({
    String? name,
    String? address,
  }) {
    return FormModel(
      name: name ?? this.name,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'address': address,
    };
  }

  factory FormModel.fromMap(Map<String, dynamic> map) {
    return FormModel(
      name: map['name'] as String,
      address: map['address'] as String,
    );
  }

//for saving data in local database
  String toJson() => json.encode(toMap());

  //for retriving data from database

  factory FormModel.fromJson(String source) =>
      FormModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FormModel(name: $name, address: $address)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FormModel && other.name == name && other.address == address;
  }

  @override
  int get hashCode => name.hashCode ^ address.hashCode;
}
