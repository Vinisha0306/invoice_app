import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice_app/utils/routes_utils.dart';

import '../../utils/Globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var Scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Scaffoldkey,
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                foregroundImage: Global.global.image != null
                    ? FileImage(Global.global.image!)
                    : null,
              ),
              accountName: Global.global.Name != null
                  ? Text(
                      Global.global.Name.toString(),
                      style: const TextStyle(color: Colors.black),
                    )
                  : const Text(
                      'Company Name',
                      style: TextStyle(color: Colors.black),
                    ),
              accountEmail: Global.global.email != null
                  ? Text(
                      Global.global.email.toString(),
                      style: const TextStyle(color: Colors.black),
                    )
                  : const Text(
                      'Company Email',
                      style: TextStyle(color: Colors.black),
                    ),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 183, 153, 255),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(MyRoutes.BuildOptions[0]['route'])
                    .then(
                      (value) => setState(
                        () {},
                      ),
                    );
              },
              child: const Text('Company Details'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Customers'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Invoices'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'WayBill',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Scaffoldkey.currentState?.openDrawer();
          },
          child: const Icon(
            CupertinoIcons.profile_circled,
            color: Colors.black,
            size: 35,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 183, 153, 255),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Company Details',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(MyRoutes.BuildOptions[0]['route'])
                        .then(
                          (value) => setState(() {}),
                        );
                  },
                  child: const Icon(Icons.add),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Invoices',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(MyRoutes.BuildOptions[1]['route']);
                  },
                  child: const Icon(Icons.add),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
