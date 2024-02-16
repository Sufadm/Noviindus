import 'package:ayurvedic_centre_patients/view/widgets/my_treatment.dart';
import 'package:flutter/material.dart';

class TreatmentAddPage extends StatelessWidget {
  final whatsapp;
  final address;
  final location;
  final branch;
  const TreatmentAddPage(
      {super.key, this.whatsapp, this.address, this.location, this.branch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyTreatmentCard(
                whatsapp: whatsapp,
                address: address,
                location: location,
                branch: branch,
              )
            ],
          ),
        ),
      ),
    );
  }
}
