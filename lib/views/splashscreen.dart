import 'dart:async';

import 'package:chatapp/helper/authenticate.dart';
import 'package:chatapp/helper/helperfunction.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'chatrooms.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  bool userIsLoggedIn;

  getLoggedInState() async {
    await HelperFunctions.getUserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
  }

  void handleTimeout() {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) =>
      userIsLoggedIn != null
          ? userIsLoggedIn ? ChatRoom() : Authenticate()
          : Container(
              child: Center(
                child: Authenticate(),
              ),
            ),
    ));
  }

  startTimeout() async {
    var duration = const Duration(seconds: 5);
    return new Timer(duration, handleTimeout);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedInState();
//    _iconAnimationController = new AnimationController(
//        vsync: this, duration: new Duration(milliseconds: 2000));
//
//    _iconAnimation = new CurvedAnimation(
//        parent: _iconAnimationController, curve: Curves.easeIn);
//    _iconAnimation.addListener(() => this.setState(() {}));
//
//    _iconAnimationController.forward();

    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Scaffold(
        body: new Center(
            child: new Image(
          image: new AssetImage("assets/images/chitchat.png"),
          width: 700,
          height: 700,
        )
        ),
      ),
    );
  }
}
//
//}
