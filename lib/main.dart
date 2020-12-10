import 'views/splashscreen.dart';
import 'package:flutter/material.dart';

import 'helper/helperfunction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff145C9E),
        scaffoldBackgroundColor: Colors.white,
        accentColor: Color(0xff007EF4),
        fontFamily: "text",
      //  visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:SplashScreen(),
    );

  }

}
