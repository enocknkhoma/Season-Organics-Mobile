import 'package:flutter/material.dart';

class CustomCategoryWidget extends StatelessWidget {
  const CustomCategoryWidget({super.key});
  @override
  Widget build(BuildContext context) {
  int i;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        for (i = 1; i < 5; i++)
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/$i.jpg',
                  width: 40,
                  height: 40,
                ),
                Text(
                  ' Sandal',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                )
              ],
            ),
          )
      ]),
    );
  }
}
