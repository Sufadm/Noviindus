import 'package:ayurvedic_centre_patients/view/widgets/my_treatment.dart';
import 'package:flutter/material.dart';

class TreatmentAddPage extends StatelessWidget {
  const TreatmentAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [MyTreatmentCard()],
        ),
      ),
    );
  }
}
