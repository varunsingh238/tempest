// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:tempest/src/constants/sizes.dart';
import 'package:tempest/src/constants/text.dart';
import 'package:velocity_x/velocity_x.dart';

class OtpScreenMobile extends StatelessWidget {
  const OtpScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage("assets/images/otp.gif")),
              Text(
                "OTP Verification",
                style: Theme.of(context).textTheme.displayMedium,
              ),
              10.heightBox,
              Text(
                "Enter the code sent at " + "+91 86975 94823",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              20.heightBox,
              OtpTextField(
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(.1),
                filled: true,
                onSubmit: (code) => print(code),
              ),
              20.heightBox,
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text(tNext)))
            ],
          ),
        ),
      )),
    );
  }
}
