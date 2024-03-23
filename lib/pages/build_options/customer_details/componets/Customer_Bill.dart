import 'package:flutter/material.dart';
import 'package:invoice_app/utils/Globals.dart';



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
          controller: Global.global.TextProductRow[index],
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
          controller: Global.global.TextQtyRow[index],
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
          controller: Global.global.TextPriceRow[index],
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
          child: Text("${Global.global.CalculTotal(index: index)}"),
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
