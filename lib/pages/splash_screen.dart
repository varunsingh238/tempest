import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tempest/api/api.dart';
import 'package:tempest/pages/home_page.dart';
import 'package:tempest/pages/welcome.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 400), () {
      if (APIs.auth.currentUser != null) {
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (_) => const HomePage()));
      } else {
        Navigator.pushReplacement(
            context, CupertinoPageRoute(builder: (_) => const WelcomeScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: mq.height * .15,
            right: mq.width * .25,
            width: mq.width * .5,
            child: Image.asset("assets/images/main_logo.png"),
          ),
          Positioned(
            bottom: mq.height * .15,
            width: mq.width,
            child: Text(
              "Made in India",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
