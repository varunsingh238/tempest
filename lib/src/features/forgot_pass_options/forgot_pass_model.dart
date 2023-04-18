// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tempest/src/constants/sizes.dart';
import 'package:tempest/src/constants/text.dart';

import '../forgot_pass_ mail/forgot_pass_mail.dart';
import '../forgot_pass_phone/forgot_pass_phone.dart';
import 'forgot_pass_options.dart';

class forgotScreen {
  static Future<dynamic> buildShowModalSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tForgetPasswordTitle,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                tForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 30,
              ),
              forgotpassWidget(
                btnIcon: Icons.mail_outline_rounded,
                title: tEmail,
                subtitle: tResetViaEMail,
                onTap: () {
                  Navigator.pop(context);

                  Get.to(() => const ForgotPassMail());
                },
              ),
              const SizedBox(
                height: 30,
              ),
              forgotpassWidget(
                  btnIcon: Icons.phone_iphone_outlined,
                  subtitle: tResetViaPhone,
                  title: tPhoneNo,
                  onTap: () {
                    Get.to(() => const ForgotPassPhone());
                  })
            ],
          ),
        ),
      ),
    );
  }
}
