import 'package:flutter/material.dart';
import 'package:invoice_app/utils/Globals.dart';

double CalculTotal({required index}) {
  double total = 0;
  double allTotal = 0;

  total = (double.tryParse(TextQtyRow[index].text) ?? 0) *
      (double.tryParse(TextPriceRow[index].text) ?? 0);

  TotalRow.add(total);
  return total;
}

Widget Bill({required onPressed, required index}) {
  return Row(
    children: [
      const SizedBox(
        height: 10,
      ),
      Expanded(
        flex: 1,
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 0.5),
          ),
          alignment: Alignment.center,
          child: Text("${index + 1}"),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Expanded(
        flex: 4,
        child: TextField(
          textInputAction: TextInputAction.next,
          controller: TextProductRow[index],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Expanded(
        flex: 2,
        child: TextField(
          textInputAction: TextInputAction.next,
          controller: TextQtyRow[index],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Expanded(
        flex: 3,
        child: TextField(
          textInputAction: TextInputAction.done,
          controller: TextPriceRow[index],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Expanded(
        flex: 4,
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 0.5),
          ),
          alignment: Alignment.center,
          child: Text("${CalculTotal(index: index)}"),
        ),
      ),
      Expanded(
        flex: 1,
        child: IconButton(
          onPressed: onPressed,
          icon: const Icon(Icons.delete_forever_sharp),
        ),
      ),
    ],
  );
}
