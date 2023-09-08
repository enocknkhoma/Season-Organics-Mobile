// import 'package:flutter/material.dart';

// class CardWidget extends StatelessWidget {
//   final String title;
//   final String orders;
//   final IconData icon;
//   const CardWidget({
//     super.key,
//     required this.title,
//     required this.orders,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 174.0,
//       height: 161.0,
//       child: Card(
//         color: Colors.white,
//         elevation: 2.0,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8.0),
//         ),
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               children: [
//                 Icon(
//                   icon,
//                   size: 64,
//                   color: Theme.of(context).colorScheme.primary,
//                 ),
//                 // Image.asset("assets/images/logo.png", width: 64),
//                 SizedBox(
//                   height: 10.0,
//                 ),
//                 Text(
//                   title,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 15.0,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5.0,
//                 ),
//                 Text(
//                   orders,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w100,
//                     fontSize: 20.0,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String orders;
  final IconData icon;

  const CardWidget({
    Key? key,
    required this.title,
    required this.orders,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 174.0,
      height: 161.0,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary, // Set the border color to orange
            width: 1.0, // Set the border width
          ),
        ),
        child: Card(
          color: Theme.of(context).colorScheme.onPrimary, // Make the Card transparent
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0), // Adjust border radius if needed
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Icon(
                    icon,
                    size: 64,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.black, // Set text color as needed
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    orders,
                    style: TextStyle(
                      color: Colors.black, // Set text color as needed
                      fontWeight: FontWeight.w100,
                      fontSize: 20.0,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
