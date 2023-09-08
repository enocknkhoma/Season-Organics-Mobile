import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:season/view/main/cart/Itemdescription.dart';

class ItemWidget extends StatelessWidget {
  const ItemWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 7; i++)
          Builder(
            builder: (BuildContext context) {
              final currentI = i;
              // create te,plate area12

              return Container(
                padding: const EdgeInsets.only(left: 15, top: 10, right: 15),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(20),
                          ),
                           child: Icon(CupertinoIcons.star, color: Theme.of(context).colorScheme.onPrimary,),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // Navigate to the item description page with the currentI
                        Get.to(() => ItemDescription(imagePath: 'assets/images/$currentI.png'));
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/$currentI.png',
                          height: 100,
                          width: 100,
                        ),
                      ),
                    ),
                    // Other item details here
                      Container(
                  padding: const EdgeInsets.only(
                    bottom: 3,
                  ),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Product Title",
                    style: TextStyle(
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Write a product description',
                    style: TextStyle(
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "\$55",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Icon(
                          Icons.shopping_cart_checkout,
                          color: Theme.of(context).colorScheme.primary,
                        )
                      ]),
                )
                  ],
                ),
              );
            },
          ),
      ],
    );
  }
}

