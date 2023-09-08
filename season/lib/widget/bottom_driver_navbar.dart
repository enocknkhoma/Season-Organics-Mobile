import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:season/widget/customer_detail_widget.dart';

class DriverBottomBar extends StatelessWidget {
  const DriverBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 300,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const customer_details_widget(title: 'Fullname:', subtitle: 'Mackay Chirwa',),
            const customer_details_widget(title: 'Order#:', subtitle: '#123456',),
            const customer_details_widget(title: 'Mobile:', subtitle: '080000000',),
            const customer_details_widget(title: 'Address:', subtitle: 'Chilobwe',),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Confirm Delivery",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
