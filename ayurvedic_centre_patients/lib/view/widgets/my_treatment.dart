import 'dart:io';
import 'dart:typed_data';
import 'package:ayurvedic_centre_patients/controller/register_api.dart';
import 'package:ayurvedic_centre_patients/view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class MyTreatmentCard extends StatefulWidget {
  final whatsapp;
  final address;
  final location;
  final branch;
  const MyTreatmentCard(
      {Key? key, this.whatsapp, this.address, this.location, this.branch})
      : super(key: key);

  @override
  _MyTreatmentCardState createState() => _MyTreatmentCardState();
}

class _MyTreatmentCardState extends State<MyTreatmentCard> {
  String? selectedTreatment;
  String? selectedTreatment2;
  String? selectedTreatment3;
  String? _selected;

  int maleCount = 0;
  int femaleCount = 0;

  final TextEditingController totalAmountController = TextEditingController();
  final TextEditingController discountAmountController =
      TextEditingController();
  final TextEditingController advanceAmountController = TextEditingController();
  final TextEditingController balanceAmountController = TextEditingController();
  final TextEditingController treatmentDateController = TextEditingController();
  final TextEditingController treatmentTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(16.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Choose Treatment',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              const Text("Treatments"),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 1.0,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        value: selectedTreatment,
                        onChanged: (newValue) {
                          setState(() {
                            selectedTreatment = newValue!;
                          });
                        },
                        items: <String>[
                          '1',
                          '2',
                          '3',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const Text("Add Patience"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: const Center(child: Text('Male'))),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          maleCount = maleCount > 0 ? maleCount - 1 : 0;
                        });
                      },
                    ),
                  ),
                  Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(child: Text('$maleCount'))),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        maleCount++;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                          height: 40,
                          width: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: const Center(child: Text('Female'))),
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          femaleCount = femaleCount > 0 ? femaleCount - 1 : 0;
                        });
                      },
                    ),
                  ),
                  Container(
                      height: 30,
                      width: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Center(child: Text('$femaleCount'))),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        femaleCount++;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Total Amount"),
                TextFormField(
                  controller: totalAmountController,
                  decoration: InputDecoration(
                    hintText: "",
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue), // Set the border color
                      borderRadius:
                          BorderRadius.circular(8.0), // Set the border radius
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Discount Amount"),
                TextFormField(
                  controller: discountAmountController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue),
                      borderRadius:
                          BorderRadius.circular(8.0), // Set the border radius
                    ),
                    hintText: "",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Payment Option"),
                Row(
                  children: [
                    Row(
                      children: [
                        createRadio("option1", _selected, (value) {
                          setState(() {
                            _selected = value;
                          });
                        }),
                        const Text(
                          "CASH",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        createRadio("option2", _selected, (value) {
                          setState(() {
                            _selected = value;
                          });
                        }),
                        const Text(
                          "CARD",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        createRadio("option3", _selected, (value) {
                          setState(() {
                            _selected = value;
                          });
                        }),
                        const Text(
                          "UPI",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                const Text("Advance Amount"),
                TextFormField(
                  controller: advanceAmountController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue), // Set the border color
                      borderRadius:
                          BorderRadius.circular(8.0), // Set the border radius
                    ),
                    hintText: "",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Balance Amount"),
                TextFormField(
                  controller: balanceAmountController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue), // Set the border color
                      borderRadius:
                          BorderRadius.circular(8.0), // Set the border radius
                    ),
                    hintText: "",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Treatment Date"),
                TextFormField(
                  controller: treatmentDateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.blue), // Set the border color
                      borderRadius:
                          BorderRadius.circular(8.0), // Set the border radius
                    ),
                    hintText: "",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Treatment Time"),
                TextFormField(
                  controller: treatmentTimeController,
                  decoration: const InputDecoration(
                    hintText: "",
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Select Treatment 2"),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedTreatment2,
                          onChanged: (newValue) {
                            setState(() {
                              selectedTreatment2 = newValue!;
                            });
                          },
                          items: <String>[
                            'Treatment A',
                            'Treatment B',
                            'Treatment C',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Select Treatment 3"),
                Container(
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: DropdownButton<String>(
                          value: selectedTreatment3,
                          onChanged: (newValue) {
                            setState(() {
                              selectedTreatment3 = newValue!;
                            });
                          },
                          items: <String>[
                            'Treatment A',
                            'Treatment B',
                            'Treatment C',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: "Save",
                    onPressed: () {
                      saveFormDataToPdf();
                    })
              ],
            ),
          ),
        ),
      ],
    );
  }

  Radio<String> createRadio(
    String value,
    String? groupValue,
    void Function(String?) onChanged,
  ) {
    return Radio<String>(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      activeColor: Colors.black,
    );
  }

// Inside your saveFormDataToPdf function
  Future<void> saveFormDataToPdf() async {
    final pdf = pw.Document();

    // Add form data to the PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Text('Your form data goes here'),
          );
        },
      ),
    );

    // Save the PDF to a file
    final Uint8List bytes =
        pdf.save() as Uint8List; // Convert List<int> to Uint8List
    final file = await createPdfFile(bytes);

    // Print or share the file as needed
    await Printing.sharePdf(bytes: bytes, filename: 'Form_Data.pdf');
  }

  Future<File> createPdfFile(List<int> bytes) async {
    // Create a file in the app's documents directory
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/Form_Data.pdf');

    // Write the PDF bytes to the file
    await file.writeAsBytes(bytes);

    return file;
  }
}
  // void saveFormData() {
  //   String? totalAmount = totalAmountController.text;
  //   String? discountAmount = discountAmountController.text;
  //   String? advanceAmount = advanceAmountController.text;
  //   String? balanceAmount = balanceAmountController.text;
  //   String? treatmentDate = treatmentDateController.text;
  //   String? treatmentTime = treatmentTimeController.text;

  //   postDataToServer(
  //     address: widget.address,
  //     branch: widget.branch,
  //     location: widget.location,
  //     whatsapp: widget.whatsapp,
  //     selectedTreatment: selectedTreatment,
  //     selectedTreatment2: selectedTreatment2,
  //     selectedTreatment3: selectedTreatment3,
  //     maleCount: maleCount,
  //     femaleCount: femaleCount,
  //     totalAmount: totalAmount,
  //     discountAmount: discountAmount,
  //     paymentOption: _selected,
  //     advanceAmount: advanceAmount,
  //     balanceAmount: balanceAmount,
  //     treatmentDate: treatmentDate,
  //     treatmentTime: treatmentTime,
  //   );
  // }

