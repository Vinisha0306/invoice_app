import 'dart:io';

import 'package:flutter/cupertino.dart';

List billrow = ["", ""];
List<TextEditingController> TextProductRow = [
  TextEditingController(),
  TextEditingController(),
];
List<TextEditingController> TextQtyRow = [
  TextEditingController(),
  TextEditingController(),
];
List<TextEditingController> TextPriceRow = [
  TextEditingController(),
  TextEditingController(),
];
List TotalRow = [];

class Global {
  String? Name, email, contact, address, GSTIN;
  String? C_Name, C_email, C_contact, C_GSTIN;
  File? image;
  static final Global global = Global();
}
