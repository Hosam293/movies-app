import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflixclone/Controller/DioHelper.dart';
import 'package:netflixclone/view/Screens/AuthScreens/LoginScreen/LoginCubit/LoginCubit.dart';
import 'package:netflixclone/view/Screens/AuthScreens/RegisterScreen/RegisterCubit/RegisterCubit.dart';
import 'package:netflixclone/view/Screens/HomeScreen/AppCubit/AppCubit.dart';
import 'package:netflixclone/view/Screens/HomeScreen/HomeScreen.dart';
import 'package:netflixclone/view/Screens/VideoScreen/VideoScreen.dart';
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();

  DioHelper.init();

  runApp( MultiBlocProvider(providers:
  [
    BlocProvider(create: (context)=>LoginCubit()),
    BlocProvider(create: (context)=>RegisterCubit()),
    BlocProvider(create: (context)=>AppCubit()..getPopularMovies()..getTopRatedMovies()..getUpcomingMovies()),
  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Netflix Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white10,
        textTheme: TextTheme(
            bodyText1: TextStyle(
                fontSize: 15,
                color: Colors.teal,
                fontWeight: FontWeight.bold)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.teal,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.light),
          backwardsCompatibility: true,
          actionsIconTheme: IconThemeData(color: Colors.black, size: 25),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            elevation: 5,
            type: BottomNavigationBarType.fixed,
            // selectedIconTheme: IconThemeData(
            //   color: Colors.teal
            // ),
            // unselectedIconTheme: IconThemeData(
            //     color: Colors.amberAccent
            // ),
            unselectedItemColor: Colors.amberAccent,
            selectedItemColor: Colors.teal
        ),
      ),
      home:  HomeScreen(),
    );
  }
}
