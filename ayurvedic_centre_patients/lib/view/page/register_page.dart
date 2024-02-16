import 'package:ayurvedic_centre_patients/view/page/treatment_add_page.dart';
import 'package:ayurvedic_centre_patients/view/widgets/custom_button.dart';
import 'package:ayurvedic_centre_patients/view/widgets/textfor_widget.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final whatsapp = TextEditingController();
  final address = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final branch = TextEditingController();
  String? selectedLocation;
  String? selectedLocation1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.notifications_active),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Register",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Divider(),
                const SizedBox(
                  height: 20,
                ),
                const Text(" Whatsapp"),
                const SizedBox(
                  height: 5,
                ),
                TextFormFieldWidget(
                  controller: whatsapp,
                  hintText: "Whatsapp Number",
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(" Address"),
                TextFormFieldWidget(
                  controller: address,
                  hintText: "Enter Address",
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Location"),
                Container(
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_drop_down),
                          ),
                          iconSize: 24,
                          hint: Container(
                              margin: const EdgeInsets.only(right: 200),
                              child: const Text('Select Location')),
                          value: selectedLocation,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedLocation = newValue!;
                            });
                          },
                          items: <String>[
                            'Option 1',
                            'Option 2',
                            'Option 3',
                            'Option 4'
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
                  height: 15,
                ),
                const Text("Branch"),
                Container(
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 1.0,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(7.0)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          icon: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_drop_down),
                          ),
                          iconSize: 24,
                          hint: Container(
                              margin: const EdgeInsets.only(right: 200),
                              child: const Text('Select Branch')),
                          value: selectedLocation1,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedLocation1 = newValue!;
                            });
                          },
                          items: <String>['167', '168', '169', '170']
                              .map<DropdownMenuItem<String>>((String value) {
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
                  height: 50,
                ),
                CustomButton(
                    text: "Add Treatments",
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return TreatmentAddPage(
                          address: address.text,
                          whatsapp: whatsapp.text,
                          location: "Kozhikode",
                          branch: "169",
                        );
                      }));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
