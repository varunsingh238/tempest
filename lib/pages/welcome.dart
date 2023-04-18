import 'package:flutter/material.dart';

import 'package:velocity_x/velocity_x.dart';

import 'login_page.dart';
import 'sign_up.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TEMPEST",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  "From, \nVarun Singh",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Image(
                  image: const AssetImage("assets/images/main_logo.png"),
                  height: height * 0.4,
                ),
                70.heightBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "  WELCOME!",
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      "    Its Great to have you with Us.",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ],
                ),
                80.heightBox,
                const Buttons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return const LoginPage();
                }));
              },
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue[500],
                  side: const BorderSide(color: Colors.black),
                  padding: const EdgeInsets.symmetric(vertical: 15)),
              child: " LOGIN ".text.make(),
            ),
          ),
        ),
        20.widthBox,
        Expanded(
            child: SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return const SignUpPage();
              }));
            },
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue[900],
                side: const BorderSide(color: Colors.black),
                padding: const EdgeInsets.symmetric(vertical: 15)),
            child: "SIGN UP".text.make(),
          ),
        ))
      ],
    );
  }
}
