import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Global {
  String? Name, email, contact, address, GSTIN;
  String? C_Name, C_email, C_contact, C_GSTIN;
  File? image;
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
  double total = 0;
  double CalculTotal({required index}) {
    total = (double.tryParse(TextQtyRow[index].text) ?? 0) *
        (double.tryParse(TextPriceRow[index].text) ?? 0);
    return total;
  }

  TextEditingController BillN = TextEditingController();
  TextEditingController Date = TextEditingController();
  int count = 0;
  static final Global global = Global();
  double totalValue = 0;
  void calculateTotalValue() {
    for (var element in TextPriceRow) {
      totalValue += double.parse(element.text.isNotEmpty ? element.text : "0") *
          double.parse(TextQtyRow[TextPriceRow.indexOf(element)].text.isNotEmpty
              ? TextQtyRow[TextPriceRow.indexOf(element)].text
              : "0");
    }
  }
}
