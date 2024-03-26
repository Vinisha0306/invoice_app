import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoice_app/pages/build_options/company_details/form/company_form.dart';

import '../../../utils/Globals.dart';
import '../../../utils/routes_utils.dart';
import '../../../widgets/SnackBar.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({super.key});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  Future<void> getImage({required ImageSource source}) async {
    ImagePicker picker = ImagePicker();

    XFile? file = await picker.pickImage(
      source: source,
    );

    if (file != null) {
      Global.global.image = File(file.path);
      setState(() {});
    }
  }

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Company Details'),
        actions: [
          ElevatedButton(
            onPressed: () {
              bool validated = formkey.currentState!.validate();
              if (validated) {
                formkey.currentState!.save();
              }
              ScaffoldMessenger.of(context).showSnackBar(
                MySnackBar(
                  color: validated ? Colors.green : Colors.red,
                  context: validated ? 'Form Saved' : 'Failed To Validate Form',
                ),
              );
            },
            child: const Text("save"),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 183, 153, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 183, 153, 255),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: s.height - 16,
          width: s.width - 16,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            image: const DecorationImage(
              image: AssetImage("lib/assets/images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Select source"),
                        actions: [
                          ElevatedButton.icon(
                            onPressed: () {
                              getImage(source: ImageSource.camera).then(
                                (value) {
                                  Navigator.pop(context);
                                },
                              );
                            },
                            icon: const Icon(CupertinoIcons.camera),
                            label: const Text("Camera"),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              getImage(source: ImageSource.gallery).then(
                                (value) {
                                  Navigator.pop(context);
                                },
                              );
                            },
                            icon: const Icon(Icons.image_outlined),
                            label: const Text("Gallery"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 70,
                    foregroundImage: Global.global.image != null
                        ? FileImage(Global.global.image!)
                        : null,
                    child: const Text('Company Logo'),
                  ),
                ),
                SizedBox(
                  height: s.height * 0.02,
                ),
                Company_Form(formkey: formkey, s: s),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, MyRoutes.BuildOptions[1]['route']);
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
