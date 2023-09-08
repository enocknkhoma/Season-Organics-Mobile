import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:season/view/driver/dashboard.dart';
import 'package:season/widget/bottom_navbar_admin.dart';
import 'package:season/widget/bottomnavbar.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  void _showErrorModal(BuildContext context) {
    Get.defaultDialog(
      title: "Incorrect OTP",
      middleText: "The entered OTP is incorrect. Please try again.",
      actions: [
        ElevatedButton(
          onPressed: () {
            Get.back(); 
          },
          child: Text("OK"),
        ),
      ],
    );
  }

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
              'We have sent an OTP to m*****@*.com please verify that you have received the notification',
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
              borderRadius: BorderRadius.circular(13),
              onCodeChanged: (String code) {},
              // Runs when every textfield is filled should make an api call
              onSubmit: (String verificationCode) {
                if (verificationCode == "123456") {
                  // If OTP is "1234", route to one page
                  Get.off(() =>
                      BottomNavBarAdmin()); // Replace Page1 with your desired destination.
                } else if (verificationCode == "654321") {
                  // If OTP is "4321", route to another
                  Get.off(() => const DriverDashboard());
                } else if (verificationCode == "000000") {
                  Get.off(() => BottomNavBar());
                } else {
                  // If OTP is incorrect, show the error modal
                  _showErrorModal(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
