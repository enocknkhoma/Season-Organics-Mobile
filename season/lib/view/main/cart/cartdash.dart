import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:season/widget/cart_bottom_nav_bar.dart';
import 'package:season/widget/cart_items_widget.dart';
import 'package:season/widget/custom_cart_app_bar.dart';

class CartDashBoard extends StatelessWidget {
  const CartDashBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 0, // Adjust the elevation as needed
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            size: 30,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        title: Text(
          "Cart",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Add your action here
            },
            icon: Icon(
              Icons.more_vert,
              size: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          // const CartAppBar(),
          Container(
            //will remove
            // height: 700,
            padding: const EdgeInsets.only(top: 15),
            decoration:const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius:  BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                const CartItems(),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 13),
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CartBottomNavBar(),
    );
  }
}
