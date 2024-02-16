import 'package:ayurvedic_centre_patients/controller/patient_list_api.dart';
import 'package:ayurvedic_centre_patients/model/patient_list.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  const MyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Patient>>(
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
          return Expanded(
            child: ListView.builder(
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
                          style: TextStyle(fontSize: 14, color: Colors.green),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("View booking details"),
                            InkWell(child: Icon(Icons.arrow_forward_ios))
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
