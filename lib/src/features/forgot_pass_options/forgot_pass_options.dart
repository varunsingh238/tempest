// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class forgotpassWidget extends StatelessWidget {
  const forgotpassWidget({
    Key? key,
    required this.btnIcon,
    required this.subtitle,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final IconData btnIcon;
  final String title, subtitle;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.all(20.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.shade300),
          child: Row(
            children: [
              Icon(
                btnIcon,
                size: 60.0,
              ),
              const SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                ],
              ),
            ],
          )),
    );
  }
}
