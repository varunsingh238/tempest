// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tempest/src/constants/sizes.dart';
import 'package:tempest/src/constants/text.dart';

import 'login_page.dart';

//bool isloading = false;

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        // body: isloading
        //     ? Center(
        //         child: Container(
        //           height: size.height / 20,
        //           width: size.height / 20,
        //           child:const CircularProgressIndicator(),
        //         ),
        //       )
        //     :
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage("assets/images/sigup.gif"),
                  height: size.height * 0.27,
                ),
                Text(
                  tSignUpTitle,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  tSignUpSubTitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const signUpForm(),
                const signUpFooter()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class signUpFooter extends StatefulWidget {
  const signUpFooter({
    super.key,
  });

  @override
  State<signUpFooter> createState() => _signUpFooterState();
}

class _signUpFooterState extends State<signUpFooter> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("OR"),
          ],
        ),
        TextButton(
            onPressed: () {
              Get.to(() => const LoginPage());
            },
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: tAlreadyHaveAnAccount,
                  style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(
                  text: tLogin.toUpperCase(),
                  style: const TextStyle(color: Colors.blue))
            ])))
      ],
    );
  }
}

class signUpForm extends StatefulWidget {
  const signUpForm({
    super.key,
  });

  @override
  State<signUpForm> createState() => _signUpFormState();
}

class _signUpFormState extends State<signUpForm> {
  final GlobalKey<FormState> _key = GlobalKey();

  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormSize - 20),
      child: Form(
          key: _key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _name,
                keyboardType: TextInputType.name,
                autofocus: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please provide an username!";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
                  label: Text(tEmail),
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
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
                  label: Text(tPassword),
                  prefixIcon: Icon(
                    Icons.password,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                //  controller: controller.phoneNo,
                keyboardType: TextInputType.number,
                autofocus: false,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Provide Phone Number!";
                  } else if (value.length < 10) {
                    return "Mobile Number length cannot be less than 10 digits";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  prefixIcon: Icon(
                    Icons.numbers,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        // moveToHome(context);
                      },
                      child: Text(tSignup.toUpperCase())))
            ],
          )),
    );
  }
}
