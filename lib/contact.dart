import 'dart:convert';

import 'package:flutter/material.dart';

class Contact {
  final String name;
  final String mobile;
  final String email;
  final Image? avatar;

  Contact(this.name, this.mobile, this.email, this.avatar);

  static Contact fromJson(dynamic json) => Contact(
      json["name"],
      json["mobile"],
      json["email"],
      json["avatar"] == null
          ? null
          : Image.memory(base64Decode(json["avatar"])));
}
