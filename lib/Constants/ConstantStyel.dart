import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme=ThemeData(
  scaffoldBackgroundColor: Colors.black,
  textTheme: TextTheme(
      bodyText1: TextStyle(
          fontSize: 15,
          color: Colors.white,
          fontWeight: FontWeight.bold)),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.teal,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.teal,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light),
    backwardsCompatibility: true,
    actionsIconTheme: IconThemeData(color: Colors.amberAccent, size: 25),
    iconTheme: IconThemeData(color: Colors.amberAccent, size: 25),

  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.grey,
    elevation: 10,
    type: BottomNavigationBarType.fixed,
  ),
);

// Container(
//   decoration: BoxDecoration(
//     borderRadius: BorderRadius.circular(10),
//     border: Border.all(color: Colors.teal, width: 3),
//   ),
//   clipBehavior: Clip.antiAliasWithSaveLayer,
//   child: Card(
//     color: Colors.teal,
//     child: Column(
//       children: [
//         Column(
//           children: [
//             Container(
//               height: 200,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(
//                       'https://image.tmdb.org/t/p/original${model.results[index].posterPath}',
//                     ),
//                     fit: BoxFit.cover,
//                   )),
//             ),
//             const SizedBox(
//               height: 3,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(4.0),
//               child: Column(
//                 children: [
//                   Text(
//                     '${model.results[index].title}',
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodyText1!
//                         .copyWith(
//                       color: Colors.amberAccent,
//                       fontSize: 12,
//                       height: 1.2,
//
//                     ),textAlign: TextAlign.center,
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ],
//     ),
//   ),
// ),