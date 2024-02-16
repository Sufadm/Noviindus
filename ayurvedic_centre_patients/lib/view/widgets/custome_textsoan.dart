import 'package:flutter/material.dart';

class CustomTextWithLinks extends StatelessWidget {
  const CustomTextWithLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: DefaultTextStyle.of(context).style,
          children: const <TextSpan>[
            TextSpan(
              text:
                  'By creating or logging into an account you are agreeing\nwith our ',
            ),
            TextSpan(
              text: 'Terms and Conditions',
              style: TextStyle(color: Colors.blue),
            ),
            TextSpan(
              text: ' and ',
            ),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(color: Colors.blue),
            ),
            TextSpan(
              text: '.',
            ),
          ],
        ),
      ),
    );
  }
}
