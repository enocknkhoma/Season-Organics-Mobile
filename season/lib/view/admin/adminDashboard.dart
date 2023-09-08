import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:season/view/driver/customer_map.dart';
import 'package:season/widget/card_item_widget.dart';
import 'package:season/widget/cart_items_widget.dart';
import 'package:season/widget/custom_app_bar.dart';
import 'package:season/widget/item_arrow.dart';
import 'package:season/widget/item_driver_list.dart';
import 'package:season/widget/recent_orders.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0, // Adjust the elevation as needed
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Dashboard",
          style: TextStyle(
              fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: const Image(
              width: 60,
              height: 60,
              image: AssetImage('assets/images/user.png'),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         const Padding(
              padding: EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children:  [
                    CardWidget(title: 'Total Orders',orders: '2000', icon: Icons.shopping_cart,),
                    CardWidget(title: 'Pending Orders',orders: '10000',icon: Icons.access_time,),
                    CardWidget(title: 'Assigned Orders',orders: '20',icon: Icons.assignment_turned_in,),
                    CardWidget(title: 'Unassigned Orders',orders: '2000',icon: Icons.assignment_late,),
                  ],
                ),
              ),
            ),
            // Add a cross section
            const item_arrow(title: 'Recent Orders', icon: Icons.arrow_right_alt,),
            Container(
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(
                color: Color(0xFFEDECF2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: const Column(
                children:  [
                  recentorder(),
                  recentorder(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
