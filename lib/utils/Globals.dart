import 'dart:io';

import 'package:flutter/cupertino.dart';

List billrow = ["", ""];
List Textrow = [
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ],
  [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ],
];

class Global {
  String? Name, email, contact, address, GSTIN;
  String? C_Name, C_email, C_contact, C_GSTIN;
  File? image;
  static final Global global = Global();
}
