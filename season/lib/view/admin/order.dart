import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:season/view/driver/customer_map.dart';
import 'package:season/widget/custom_app_bar.dart';
import 'package:season/widget/item_driver_list.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders>  with SingleTickerProviderStateMixin {
   late TabController _tabController;
  final List<List<dynamic>> item = [
    [
      '8:30 AM, Aug 2023 \nChimwankhunda',
      'Mrs Jane Doe',
      'assets/images/1.png',
      45
    ],
    [
      '8:30 AM, Aug 2023 \nChimwankhunda',
      'Mrs Jane Doe',
      'assets/images/1.png',
      45
    ],
    [
      '8:30 AM, Aug 2023 \nChimwankhunda',
      'Mrs Jane Doe',
      'assets/images/1.png',
      45
    ],
    [
      '8:30 AM, Aug 2023 \nChimwankhunda',
      'Mrs Jane Doe',
      'assets/images/1.png',
      45
    ],
    [
      '8:30 AM, Aug 2023 \nChimwankhunda',
      'Mrs Jane Doe',
      'assets/images/1.png',
      45
    ],
    [
      '8:30 AM, Aug 2023 \nChimwankhunda',
      'Mrs Jane Doe',
      'assets/images/1.png',
      45
    ],
    [
      '8:30 AM, Aug 2023 \nChimwankhunda',
      'Mrs Jane Doe',
      'assets/images/1.png',
      45
    ],
    [
      '8:30 AM, Aug 2023 \nChimwankhunda',
      'Mrs Jane Doe',
      'assets/images/1.png',
      45
    ],
  ];

  List items = List.generate(20, (index) => 'Item ${index + 1}');
  int currentPage = 1;
  int itemsPerPage = 20;

  bool isLoading = false;
  void loadMoreItems() {
    setState(() {
      isLoading = true;
    });
    // Simulating an API call or data loading delay
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        currentPage++;
        items.addAll(List.generate(
            itemsPerPage, (index) => 'Item ${items.length + index + 1}'));
        isLoading = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // if it doesnt look nice remove the appbar
  @override
  Widget build(BuildContext context) {
    int i;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0, // Adjust the elevation as needed
        automaticallyImplyLeading: false,

        centerTitle: true,
        title: Text(
          "Orders",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
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
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              text: 'Pending Orders',
            ),
            Tab(text: 'Assigned Orders'),
          ],
          labelColor: Colors.white, // Color for the selected tab text
          unselectedLabelColor: Colors.black, // Color for unselected tab text
          indicatorColor: Colors.white, 
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Content for the first tab
          ListView.builder(
            itemCount: item.length,
            // itemCount: items.length,
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(() => CustomerMap());
                },
                child: ItemDriverList(
                  companyName: item[index][0],
                  jobTitle: item[index][1],
                  logoImagePath: item[index][2],
                  hourlyRates: item[index][3],
                ),
              );
            },
          ),
          ListView.builder(
            itemCount: item.length,
            // itemCount: items.length,
            // scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ItemDriverList(
                companyName: item[index][0],
                jobTitle: item[index][1],
                logoImagePath: item[index][2],
                hourlyRates: item[index][3],
              );
            },
          ),
          // ListView.builder(
          //   itemCount: item.length,
          //   // itemCount: items.length,
          //   // scrollDirection: Axis.horizontal,
          //   itemBuilder: (context, index) {

          //       return ItemDriverList(
          //         companyName: item[index][0],
          //         jobTitle:item[index][1],
          //         logoImagePath:item[index][2],
          //         hourlyRates:item[index][3],
          //       );

          //   },
          // ),
        ],
      ),
    );
  }
}
