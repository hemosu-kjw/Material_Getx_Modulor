import 'package:flutter/material.dart';

class User {
  final String name;
  final String description;

  const User({
    required this.name,
    required this.description,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          this.name == other.name &&
          this.description == other.description;

  @override
  int get hashCode => name.hashCode ^ description.hashCode;

  static User fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        description: json['description'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };
}
