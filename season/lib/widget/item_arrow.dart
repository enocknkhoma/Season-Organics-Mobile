import 'package:flutter/material.dart';

class item_arrow extends StatelessWidget {
  final String title;
  final IconData icon;

  const item_arrow({
    super.key,
    required this.icon, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          Icon(
            icon,
          ),
        ],
      ),
    );
  }
}
