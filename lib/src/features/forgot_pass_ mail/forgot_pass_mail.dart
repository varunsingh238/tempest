import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tempest/src/constants/sizes.dart';
import 'package:tempest/src/constants/text.dart';

import '../forgot_pass_otp/forgot_pass_otp.dart';

class ForgotPassMail extends StatefulWidget {
  const ForgotPassMail({super.key});

  @override
  State<ForgotPassMail> createState() => _ForgotPassMailState();
}

class _ForgotPassMailState extends State<ForgotPassMail> {
  final GlobalKey<FormState> _key = GlobalKey();
  bool changeButton = false;

  moveToHome(BuildContext context) async {
    if (_key.currentState!.validate()) {
      setState(() {
        changeButton = true;
        Get.to(() => const OtpScreen());
      });
      await Future.delayed(const Duration(seconds: 1));
      //UIHelper.showLoadingDialog(context, "Signing in....");
      // await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                      image: const AssetImage("assets/images/customer.gif"),
                      height: size.height * 0.4),
                  Text(
                    tForgetPassword,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    tForgetPasswordSubTitle,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: tFormSize,
                  ),
                  Form(
                      key: _key,
                      child: Column(
                        children: [
                          TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please provide an email";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                label: Text(tEmail),
                                hintText: tEmail,
                                prefixIcon: Icon(Icons.mail_outline_rounded)),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                  onPressed: () {
                                    moveToHome(context);
                                  },
                                  child: const Text(tNext)))
                        ],
                      ))
                ],
              )),
        ),
      ),
    );
  }
}
