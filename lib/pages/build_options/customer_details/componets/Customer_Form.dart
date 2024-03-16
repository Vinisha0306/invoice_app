import 'package:flutter/material.dart';

import '../../../../utils/Globals.dart';
import '../../../../widgets/SnackBar.dart';

Widget C_form({required formkey, required context}) {
  return SingleChildScrollView(
    child: AlertDialog(
      title: const Text(
        'Customer Details',
      ),
      actions: [
        //name
        Form(
          key: formkey,
          child: Column(
            children: [
              TextFormField(
                onSaved: (val) {
                  Global.global.C_Name = val;
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
                  hintText: 'Customer Name',
                  labelText: 'Name',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              const SizedBox(
                height: 0.03,
              ),
              // gstin
              TextFormField(
                onSaved: (val) {
                  Global.global.C_GSTIN = val;
                },
                validator: (val) {
                  return val!.isEmpty ? 'Must Enter GSTIN No.' : null;
                },
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Customer GSTIN',
                  labelText: 'GSTIN',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              const SizedBox(
                height: 0.03,
              ),
              // contact
              TextFormField(
                onSaved: (val) {
                  Global.global.C_contact = val;
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
                  hintText: 'Customer Contact',
                  labelText: 'Contact',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              const SizedBox(
                height: 0.03,
              ),
              //email
              TextFormField(
                onSaved: (val) {
                  Global.global.C_email = val;
                },
                validator: (val) {
                  return val!.isEmpty
                      ? "Must Enter Email"
                      : RegExp(r'''^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$''')
                              .hasMatch(val)
                          ? null
                          : "Invalid email";
                },
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Customer Email Id',
                  labelText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              const SizedBox(
                height: 0.07,
              ),
              ElevatedButton(
                onPressed: () {
                  bool validated = formkey.currentState!.validate();
                  if (validated) {
                    formkey.currentState!.save();
                    Navigator.pop(context);
                  }
                  ScaffoldMessenger.of(context).showSnackBar(
                    MySnackBar(
                      color: validated ? Colors.green : Colors.red,
                      context:
                          validated ? 'Form Saved' : 'Failed To Validate Form',
                    ),
                  );
                },
                child: Text('Done'),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
