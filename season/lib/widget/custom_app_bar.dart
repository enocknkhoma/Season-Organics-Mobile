import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:season/view/main/cart/cartdash.dart';
// import 'package:badges/badges.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child: Row(
        children: [
          Icon(
            Icons.sort,
            size: 30,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Text(
              'Season Organics',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          const Spacer(),
          Badge(
            // backgroundColor: Theme.of(context).colorScheme.tertiary,
            // padding: const EdgeInsets.only(bottom:13,top:15 ),
            label: Text(
              '3+',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            child: InkWell(
              onTap: () {
                Get.to(() => const CartDashBoard());
              },
              child: Icon(
                Icons.shopping_bag_outlined,
                size: 32,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}
