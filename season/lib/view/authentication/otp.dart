import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('This is a title'),
            const Text('second title'),
            const Text('mackay01@outlook.com', textAlign: TextAlign.center,),
            OtpTextField(
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              numberOfFields: 6,
              borderColor: Color(0xFF512DA8),
              showFieldAsBox: true,
              onCodeChanged: (String code) {
              },
              //runs when every textfield is filled should make an api call
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    },
                    );
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
