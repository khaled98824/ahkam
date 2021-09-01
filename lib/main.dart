import 'package:ahkam/getx/posts_controller.dart';
import 'package:ahkam/provider/email_sign_in.dart';
import 'package:ahkam/provider/google_sign_in.dart';
import 'package:ahkam/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller =Get.putAsync(() async => PostsController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider(create: (context) => GoogleSignInProvider()),
        ChangeNotifierProvider(create: (context) => EmailSignInProvider()),
    ],
    child:
      GetMaterialApp(
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
                  letterSpacing: 2,
                  wordSpacing: 2,
                  height: 1.5,
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
              ),
            headline2: TextStyle(
                fontFamily: 'Montserrat-Arabic Regular',
                fontSize: 18,
                color: Colors.black),),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                      fontFamily: 'Montserrat-Arabic Regular',
                      fontSize: 22)))),
      home: HomeScreen(),
      )
    );
  }
}


