import 'package:ahkam/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Montserrat-Arabic Regular',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'Montserrat-Arabic Regular',
                  fontSize: 44,
                  color: Colors.white),
              headline5: TextStyle(
                  fontFamily: 'Montserrat-Arabic Regular',
                  fontSize: 16,
                  color: Colors.black),
              headline4: TextStyle(
                  fontFamily: 'Montserrat-Arabic Regular',
                  fontSize: 15,
                  wordSpacing: 1,
                  letterSpacing: 1,
                  height: 1.4,
                  color: Colors.white),
              headline3: TextStyle(
                fontFamily: 'Montserrat-Arabic Regular',
                fontSize: 12,
                color: Colors.black.withOpacity(0.8),
              )),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'Montserrat-Arabic Regular',
                      fontSize: 22)))),
      home: HomeScreen(),
    );
  }
}


