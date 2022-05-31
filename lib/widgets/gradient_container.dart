// import 'dart:ui';

// import 'package:flutter/material.dart';

// class GradientContainer extends StatelessWidget {
//   const GradientContainer({ Key? key,}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BackdropFilter(
//       filter: ImageFilter.blur(sigmaX: 2,sigmaY: 2),
//       child: Container(
//                 decoration:  BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment.topCenter,
//                     end: Alignment.bottomCenter,
//                     colors: [
//                       Colors.white.withOpacity(0.3),
//                       Colors.white.withOpacity(0.6),
//                     ],
//                   ),
                 
//                 ),
//                 height: 85,
//                 width: double.infinity,
//               ),
//     );
//   }
// }