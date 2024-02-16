import 'package:ayurvedic_centre_patients/controller/login_api.dart';
import 'package:ayurvedic_centre_patients/view/widgets/custom_button.dart';
import 'package:ayurvedic_centre_patients/view/widgets/custome_textsoan.dart';
import 'package:ayurvedic_centre_patients/view/widgets/textfor_widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController pass = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/Frame 176.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Image.asset("assets/Asset 1 2.png"),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Login or register to book\nYour appointments",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(" Email"),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormFieldWidget(
                      controller: username,
                      hintText: "Enter your Email",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(" Password"),
                    TextFormFieldWidget(
                      controller: pass,
                      hintText: "Enter Password",
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      onPressed: () async {
                        await postUser(username.text, pass.text, context);
                      },
                      text: "Login",
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    const CustomTextWithLinks()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
