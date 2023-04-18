// ignore_for_file: camel_case_types

import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tempest/api/api.dart';
import 'package:tempest/customUi/helper.dart';
import 'package:tempest/pages/home_page.dart';
import 'package:tempest/pages/sign_up.dart';
import 'package:tempest/src/features/forgot_pass_options/forgot_pass_model.dart';

import '../src/constants/sizes.dart';
import '../src/constants/text.dart';

bool isloading = false;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:
            // isloading
            //     ? Center(
            //         child: Container(
            //           height: size.height / 20,
            //           width: size.height / 20,
            //           child: const CircularProgressIndicator(),
            //         ),
            //       )
            //  :
            SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage("assets/images/login.gif"),
                  height: size.height * 0.25,
                ),
                Text(
                  tLoginTitle,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  tLoginSubTitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const loginForm(),
                const loginFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class loginFooter extends StatefulWidget {
  const loginFooter({
    super.key,
  });

  @override
  State<loginFooter> createState() => _loginFooterState();
}

class _loginFooterState extends State<loginFooter> {
  _handleGoogleLogin() {
    Dialogs.showProgessbar(context);
    _signInWithGoogle().then((user) {
      Navigator.pop(context);
      if (user != null) {
        log('User: ${user.user}');
        log('UserAdditionalInfo : ${user.additionalUserInfo}');
        Navigator.pushReplacement(context,
            CupertinoPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

  Future<UserCredential?> _signInWithGoogle() async {
    // Trigger the authentication flow
    try {
      await InternetAddress.lookup('google.com');
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await APIs.auth.signInWithCredential(credential);
    } catch (e) {
      Dialogs.showSnackbar(
          context, "Something went wrong, Check your Internet!");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
              icon: const Image(
                image: AssetImage('assets/images/google-logo.png'),
                width: 20,
              ),
              onPressed: () {
                _handleGoogleLogin();
              },
              label: Text(tSignInWithGoogle.toUpperCase())),
        ),
        const SizedBox(
          height: tFormSize - 20,
        ),
        TextButton(
            onPressed: () => Get.to(() => const SignUpPage()),
            child: Text.rich(TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                      text: tSignup.toUpperCase(),
                      style: const TextStyle(color: Colors.blue))
                ]))),
      ],
    );
  }
}

class loginForm extends StatefulWidget {
  const loginForm({
    super.key,
  });

  @override
  State<loginForm> createState() => _loginFormState();
}

class _loginFormState extends State<loginForm> {
  final TextEditingController _email = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _pass = TextEditingController();

  moveToHome(BuildContext context) async {
    if (_key.currentState!.validate()) {
      setState(() {
        isloading = true;
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const HomePage()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: tFormSize - 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please provide an email!";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_outline_outlined),
                    labelText: tEmail,
                    hintText: tEmail,
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: tFormSize - 20,
              ),
              TextFormField(
                controller: _pass,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                autofocus: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password cannot be empty";
                  } else if (value.length < 6) {
                    return "Password length should be atleast 6 characters";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.fingerprint),
                    labelText: tPassword,
                    hintText: tPassword,
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: null,
                        icon: Icon(Icons.remove_red_eye_sharp))),
              ),
              const SizedBox(
                height: tFormSize - 20,
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        forgotScreen.buildShowModalSheet(context);
                      },
                      child: const Text(tForgetPassword))),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    //moveToHome(context);
                  },
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  child: Text(tLogin.toUpperCase()),
                ),
              )
            ],
          ),
        ));
  }
}
