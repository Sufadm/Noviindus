import 'package:ayurvedic_centre_patients/view/page/register_page.dart';
import 'package:ayurvedic_centre_patients/view/widgets/card_widget.dart';
import 'package:ayurvedic_centre_patients/view/widgets/custom_button.dart';
import 'package:ayurvedic_centre_patients/view/widgets/textfor_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                      width: 260,
                      height: 55,
                      child: TextFormFieldWidget(
                        hintText: "Search for treatments",
                      )),
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
                          }))
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
                          border: Border.all(color: Colors.black)),
                      child: const Row(
                        children: [
                          Center(child: Text("  Date")),
                          SizedBox(
                            width: 60,
                          ),
                          Icon(
                            Icons.arrow_downward,
                            size: 20,
                          )
                        ],
                      ))
                ],
              ),
              const Divider(),
              const MyCard(),
              CustomButton(
                  text: "Register",
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const RegisterPage();
                    }));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
