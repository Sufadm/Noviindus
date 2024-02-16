import 'package:ayurvedic_centre_patients/controller/patient_list_api.dart';
import 'package:ayurvedic_centre_patients/model/patient_list.dart';
import 'package:ayurvedic_centre_patients/view/page/register_page.dart';
import 'package:ayurvedic_centre_patients/view/widgets/card_widget.dart';
import 'package:ayurvedic_centre_patients/view/widgets/custom_button.dart';
import 'package:ayurvedic_centre_patients/view/widgets/textfor_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {});
  }

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
      body: SafeArea(
        child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refreshData,
          child: ListView(
            padding: const EdgeInsets.all(15.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 260,
                    height: 55,
                    child: TextFormFieldWidget(
                      hintText: "Search for treatments",
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 95,
                    height: 50,
                    child: CustomButton(
                      text: "Submit",
                      onPressed: () {
                        // fetchData();
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Sort by:"),
                  Container(
                    width: 130,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Row(
                      children: [
                        Center(child: Text("  Date")),
                        SizedBox(
                          width: 60,
                        ),
                        Icon(
                          Icons.arrow_downward,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(),
              FutureBuilder<List<Patient>>(
                future: fetchData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<Patient> patients = snapshot.data!;
                    if (patients.isEmpty) {
                      return const Text('No data available');
                    }
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: patients.length,
                      itemBuilder: (context, index) {
                        Patient patient = patients[index];
                        return Card(
                          margin: const EdgeInsets.all(16.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  patient.name,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                const Text(
                                  'Couple Combo Package (Rejuven... (truncated)',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.green),
                                ),
                                const SizedBox(height: 16.0),
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_today),
                                    const SizedBox(width: 4.0),
                                    const Text('31/01/2024'),
                                    const SizedBox(width: 10),
                                    const Icon(Icons.person),
                                    const SizedBox(width: 4.0),
                                    Text(patient.user),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                const Divider(color: Colors.black),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("View booking details"),
                                    InkWell(
                                        child: Icon(Icons.arrow_forward_ios))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
              CustomButton(
                text: "Register",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const RegisterPage();
                    }),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
