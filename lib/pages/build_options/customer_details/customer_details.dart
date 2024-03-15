import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Invoice',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 183, 153, 255),
      ),
      backgroundColor: const Color.fromARGB(255, 183, 153, 255),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          alignment: Alignment.topLeft,
          child: Column(
            children: <Widget>[
              SizedBox(
                width: 200,
                child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Customer Details',
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'Customer Details',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
