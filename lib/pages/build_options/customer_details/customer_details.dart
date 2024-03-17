import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:invoice_app/pages/build_options/customer_details/componets/Customer_Bill.dart';
import 'package:invoice_app/pages/build_options/customer_details/componets/Customer_Form.dart';

import '../../../utils/Globals.dart';

class InvoicePage extends StatefulWidget {
  const InvoicePage({super.key});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double Totalvalue() {
      double Total = 0;

      for (int j = 0; j < TotalRow.length; j++) {
        Total += TotalRow[j];
      }
      return Total;
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
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
          padding: const EdgeInsets.all(16),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: OutlinedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) =>
                              C_form(formkey: formkey, context: context),
                        );
                      },
                      child: const Text(
                        'Customer Details',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        hintText: 'Bill No.',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: TextField(
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: 'Invoice Date',
                        hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 40,
                    width: size.width,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.black,
                        width: 0.4,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                        "No.     Product       Qty     Price           Total"),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ...List.generate(
                    billrow.length,
                    (index) => Column(
                      children: [
                        Bill(
                            onPressed: () {
                              billrow.removeAt(index);
                              TextProductRow.removeAt(index);
                              TextQtyRow.removeAt(index);
                              TextPriceRow.removeAt(index);
                              setState(() {});
                            },
                            index: index),
                        const SizedBox(
                          height: 5,
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          billrow.add("");
                          TextProductRow.add(TextEditingController());
                          TextQtyRow.add(TextEditingController());
                          TextPriceRow.add(TextEditingController());

                          setState(() {});
                        },
                        child: const Text('Add Product'),
                      ),
                      Container(
                        height: 50,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 0.5),
                        ),
                        alignment: Alignment.center,
                        child: Text("Total : ${Totalvalue()}"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
