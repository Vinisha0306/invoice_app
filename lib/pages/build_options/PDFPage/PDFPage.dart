import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';

import '../../../utils/Globals.dart';

class PDFPage extends StatefulWidget {
  const PDFPage({super.key});

  @override
  State<PDFPage> createState() => _PDFPageState();
}

class _PDFPageState extends State<PDFPage> {
  @override
  Widget build(BuildContext context) {
    Future<Uint8List> getPDF() async {
      ByteData byteData = await rootBundle.load(
          "https://drvandanaverma.in/wp-content/uploads/2019/05/parallax-bg.jpg");
      pw.Document pdf = pw.Document();

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Padding(
              padding: const pw.EdgeInsets.all(5),
              child: pw.Column(
                children: [
                  pw.Container(
                    padding: const pw.EdgeInsets.all(5),
                    height: 100,
                    width: double.infinity,
                    child: pw.Row(
                      children: [
                        pw.Column(
                          crossAxisAlignment: pw.CrossAxisAlignment.start,
                          children: [
                            pw.Text(
                              'Invoice',
                              style: pw.TextStyle(
                                fontSize: 28,
                                fontWeight: pw.FontWeight.bold,
                              ),
                            ),
                            pw.Spacer(),
                            pw.Row(
                              children: [
                                pw.Text(
                                  'Name\t\t : ${Global.global.C_Name ?? "Demo Name"}\t\t\t\t\t\t ',
                                  style: const pw.TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                pw.Text(
                                  '\t\t\t\t\t\tBill No : ${Global.global.BillN.text}',
                                  style: const pw.TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                            pw.Row(
                              children: [
                                pw.Text(
                                  'Contact : ${Global.global.C_contact ?? "Demo Name"}\t\t\t ',
                                  style: const pw.TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                pw.Text(
                                  'Date : ${Global.global.Date.text}',
                                  style: const pw.TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Data Table
                  pw.SizedBox(height: 10),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(5),
                    height: 500,
                    width: double.infinity,
                    // color: PdfColors.grey,
                    child: pw.Row(
                      children: [
                        pw.Container(
                          padding: const pw.EdgeInsets.all(5),
                          width: 50,
                          height: 480,
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                                width: 1.5, color: PdfColors.black),
                            borderRadius: pw.BorderRadius.circular(5),
                          ),
                          child: pw.Column(
                            children: [
                              pw.Text(
                                'No.',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20),
                              ),
                              pw.SizedBox(height: 10),
                              ...Global.global.TextProductRow.map(
                                (e) => pw.Text(
                                  '${Global.global.TextProductRow.indexOf(e) + 1}',
                                  style: const pw.TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        pw.SizedBox(width: 5),
                        pw.Container(
                          padding: const pw.EdgeInsets.all(5),
                          width: 200,
                          height: 480,
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                                width: 1.5, color: PdfColors.black),
                            borderRadius: pw.BorderRadius.circular(5),
                          ),
                          child: pw.Column(
                            children: [
                              pw.Text(
                                'Product',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20),
                              ),
                              pw.SizedBox(height: 10),
                              ...Global.global.TextProductRow.map(
                                (e) => pw.Text(
                                  e.text,
                                  style: const pw.TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        pw.SizedBox(width: 5),
                        pw.Container(
                          padding: const pw.EdgeInsets.all(5),
                          width: 65,
                          height: 480,
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                                width: 1.5, color: PdfColors.black),
                            borderRadius: pw.BorderRadius.circular(5),
                          ),
                          child: pw.Column(
                            children: [
                              pw.Text(
                                'Qty.',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20),
                              ),
                              pw.SizedBox(height: 10),
                              ...Global.global.TextQtyRow.map(
                                (e) => pw.Text(
                                  e.text,
                                  style: const pw.TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        pw.SizedBox(width: 5),
                        pw.Container(
                          padding: const pw.EdgeInsets.all(5),
                          width: 55,
                          height: 480,
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                                width: 1.5, color: PdfColors.black),
                            borderRadius: pw.BorderRadius.circular(5),
                          ),
                          child: pw.Column(
                            children: [
                              pw.Text(
                                'Prc.',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20),
                              ),
                              pw.SizedBox(height: 10),
                              ...Global.global.TextPriceRow.map(
                                (e) => pw.Text(
                                  Global.global.TextPriceRow.isNotEmpty
                                      ? e.text
                                      : "0",
                                  style: const pw.TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        pw.SizedBox(width: 5),
                        pw.Container(
                          padding: const pw.EdgeInsets.all(5),
                          width: 70,
                          height: 480,
                          decoration: pw.BoxDecoration(
                            border: pw.Border.all(
                                width: 1.5, color: PdfColors.black),
                            borderRadius: pw.BorderRadius.circular(5),
                          ),
                          child: pw.Column(
                            children: [
                              pw.Text(
                                'Amt.',
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold,
                                    fontSize: 20),
                              ),
                              pw.SizedBox(height: 10),
                              ...Global.global.TextPriceRow.map(
                                (e) => pw.Text(
                                  (e.text.isNotEmpty
                                          ? Global.global.CalculTotal(
                                              index: Global.global.TextPriceRow
                                                  .indexOf(e))
                                          : "0")
                                      .toString(),
                                  style: const pw.TextStyle(
                                    fontSize: 16,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(5),
                    width: double.infinity,
                    height: 30,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(width: 1.5, color: PdfColors.black),
                      borderRadius: pw.BorderRadius.circular(5),
                    ),
                    alignment: pw.Alignment.centerRight,
                    child: pw.Text(
                        'Total = ${Global.global.calculateTotalValue()}'),
                  ),
                  pw.SizedBox(height: 5),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(5),
                    width: double.infinity,
                    height: 68.5,
                    decoration: pw.BoxDecoration(
                      border: pw.Border.all(width: 1.5, color: PdfColors.black),
                      borderRadius: pw.BorderRadius.circular(5),
                    ),
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "- Thank you for choosing ${Global.global.Name}. We appreciate your business!",
                          style: const pw.TextStyle(
                            fontSize: 13,
                          ),
                        ),
                        pw.Row(
                          children: [
                            pw.Text(
                              "Company Name : ${Global.global.Name ?? "0"}\t\t\t\t",
                              style: const pw.TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            pw.Text(
                              "Company Email : ${Global.global.email ?? "0"}",
                              style: const pw.TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        pw.Row(
                          children: [
                            pw.Text(
                              "Company GSTIN : ${Global.global.GSTIN ?? "0"}\t\t\t\t",
                              style: const pw.TextStyle(
                                fontSize: 15,
                              ),
                            ),
                            pw.Text(
                              "Company Contact no. : ${Global.global.contact ?? "0"}",
                              style: const pw.TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        pw.SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
      return pdf.save();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'),
      ),
      body: PdfPreview(
        build: (format) => getPDF(),
      ),
    );
  }
}
