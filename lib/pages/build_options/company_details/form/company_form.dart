import 'package:flutter/material.dart';

import '../../../../utils/Globals.dart';

Widget Company_Form({
  required formkey,
  required s,
}) {
  return Form(
    key: formkey,
// name
    child: Column(
      children: [
        Global.global.Name == null
            ? TextFormField(
                onSaved: (val) {
                  Global.global.Name = val;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Must Enter Name';
                  } else {
                    return null;
                  }
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Company Name',
                  labelText: 'Company Name',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              )
            : Text("Company Name : ${Global.global.Name ?? "0"}"),

        SizedBox(
          height: s.height * 0.02,
        ),
//contact
        Global.global.contact == null
            ? TextFormField(
                onSaved: (val) {
                  Global.global.contact = val;
                },
                validator: (val) {
                  return val!.isEmpty
                      ? 'Must Enter Contact Number'
                      : val.length < 10
                          ? 'Must Enter 10 Digit'
                          : null;
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Company Contact',
                  labelText: 'Contact',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              )
            : Text("Company Contact : +91 ${Global.global.contact ?? "0"}"),
        SizedBox(
          height: s.height * 0.02,
        ),
// email
        Global.global.email == null
            ? TextFormField(
                onSaved: (val) {
                  Global.global.email = val;
                },
                validator: (val) {
                  return val!.isEmpty
                      ? "Must Enter Email"
                      : RegExp(r'''^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$''')
                              .hasMatch(val)
                          ? null
                          : "Invalid email";
                },
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Company Email',
                  labelText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              )
            : Text("Company Email : ${Global.global.email ?? "0"}"),

        SizedBox(
          height: s.height * 0.02,
        ),
// gstin
        Global.global.GSTIN == null
            ? TextFormField(
                onSaved: (val) {
                  Global.global.GSTIN = val;
                },
                validator: (val) {
                  return val!.isEmpty ? 'Must Enter GSTIN No.' : null;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Company GSTIN No.',
                  labelText: 'GSTIN No.',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              )
            : Text("Company GSTIN No. : ${Global.global.GSTIN ?? "0"}"),
        SizedBox(
          height: s.height * 0.02,
        ),
// address
        Global.global.address == null
            ? TextFormField(
                onSaved: (val) {
                  Global.global.address = val;
                },
                validator: (val) {
                  return val!.isEmpty ? 'Must Enter Address' : null;
                },
                textInputAction: TextInputAction.done,
                maxLines: 2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Company Address',
                  labelText: 'Address',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              )
            : Text("Company Address : ${Global.global.address ?? "0"}"),
      ],
    ),
  );
}
