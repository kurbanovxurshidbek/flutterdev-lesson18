import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/pages/signin_page.dart';
import 'package:instaclone/pages/signup_page.dart';
import 'package:instaclone/pages/splash_page.dart';
import 'package:instaclone/services/notif_service.dart';

import 'pages/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCwIix_lK4NnoULOH6PYkxxCuBWcTIRKKs',
      appId: '1:562947487290:android:306582f20b1759c9cd2703',
      messagingSenderId: '562947487290',
      projectId: 'instaclone-2-e33a7',
    ),
  );
  await NotifService().init();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashPage(),
      routes: {
        SplashPage.id: (context) => SplashPage(),
        HomePage.id: (context) => HomePage(),
        SignInPage.id: (context) => SignInPage(),
        SignUpPage.id: (context) => SignUpPage(),
      },
    );
  }
}

