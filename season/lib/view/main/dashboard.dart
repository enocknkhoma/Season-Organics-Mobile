import 'package:flutter/material.dart';
import 'package:season/widget/custom_app_bar.dart';
import 'package:season/widget/custom_category_widget.dart';
import 'package:season/widget/item_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // if it doesnt look nice remove the appbar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
      children: [
        // Custom Navigation
        const CustomAppBar(),
        Container(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          decoration: const BoxDecoration(
            color: Color(0xFFEDECF2),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            children: [
              // Search widget
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 50,
                      width: 300,
                      child: TextFormField(
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: "Search...."),
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.search,
                      size: 27,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
              //You might remove this container
              // Container(
              //   alignment: Alignment.centerLeft,
              //   margin: const EdgeInsets.symmetric(
              //     horizontal: 10,
              //     vertical: 20,
              //   ),
              //   child: Text(
              //     'Categories',
              //     style: TextStyle(
              //       fontSize: 16,
              //       fontWeight: FontWeight.bold,
              //       color: Theme.of(context).colorScheme.primary,
              //     ),
              //   ),
              // ),
              // Categories that might be removed
              // const CustomCategoryWidget(),
              //Items Header
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Text(
                  'Top Selling',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              // Item Widget
              const ItemWidget()
            ],
          ),
        )
      ],
    ));
  }
}
