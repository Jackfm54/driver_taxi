import 'dart:io';
import 'package:flutter/material.dart';
import 'package:driver_taxi/SplashScreen/Splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Verifica si ya existe una instancia de Firebase
  if (Firebase.apps.isEmpty) {
    if (Platform.isAndroid) {
      //await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyDPy-2Nzg0nQCGu86KAOyUKRdP0GHGa8b0",
          authDomain: "uber-taxi-app-5e064.firebaseapp.com",
          projectId: "uber-taxi-app-5e064",
          storageBucket: "uber-taxi-app-5e064.appspot.com",
          messagingSenderId: "20457524542",
          appId: "1:20457524542:web:9f52d69035dc2cb45f306f",
          measurementId: "G-0SVQWFRRTD",
        );
      //);
    } else {
      await Firebase.initializeApp();
    }
  }

  runApp(
    MyApp(
      child: MaterialApp(
        title: 'Drivers App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MySplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final Widget? child;

  const MyApp({Key? key, this.child}) : super(key: key);

  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child!,
    );
  }
}
