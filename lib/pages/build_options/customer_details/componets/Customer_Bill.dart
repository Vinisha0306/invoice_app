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
        flex: 3,
        child: TextField(
          controller: Textrow[index],
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
        flex: 1,
        child: TextField(
          controller: Textrow[index],
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
          controller: Textrow[index],
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
          controller: Textrow[index],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      Expanded(
        child: IconButton(
          onPressed: onPressed,
          icon: Icon(Icons.delete_forever_sharp),
        ),
      ),
    ],
  );
}
