import 'package:ayurvedic_centre_patients/view/widgets/custom_button.dart';
import 'package:ayurvedic_centre_patients/view/widgets/textfor_widget.dart';
import 'package:flutter/material.dart';

class MyTreatmentCard extends StatefulWidget {
  const MyTreatmentCard({super.key});

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
                const TextFormFieldWidget(
                  hintText: "",
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Discount Amount"),
                const TextFormFieldWidget(
                  hintText: "",
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
                        Text(
                          "CASH",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _selected == "option1" ? Colors.blue : null,
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
                        Text(
                          "CARD",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _selected == "option2" ? Colors.blue : null,
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
                        Text(
                          "UPI",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _selected == "option3" ? Colors.blue : null,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const Text("Advance Amount"),
                const TextFormFieldWidget(
                  hintText: "",
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Balance Amount"),
                const TextFormFieldWidget(
                  hintText: "",
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Treatment Date"),
                const TextFormFieldWidget(
                  hintText: "",
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Treatment Time"),
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
                  height: 10,
                ),
                CustomButton(text: "Save", onPressed: () {})
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
}
