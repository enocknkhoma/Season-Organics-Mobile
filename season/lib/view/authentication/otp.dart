import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:season/widget/bottomnavbar.dart';

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
            Icon(
              Icons.mail,
              size: 150,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Text(
              'We have sent an OTP to mackay01@outlook.com please verify that you have received the notification',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            OtpTextField(
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              numberOfFields: 6,
              autoFocus: true,
              fieldWidth: 50,
              borderWidth: 1,
              borderColor: Theme.of(context).colorScheme.primary,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              //runs when every textfield is filled should make an api call
              onSubmit: (String verificationCode) {
                Get.to(() => BottomNavBar());
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }
}
