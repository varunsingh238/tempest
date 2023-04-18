// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tempest/models/chatmodel.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key? key,
    required this.contact,
  }) : super(key: key);
  final ChatModel contact;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        height: 53,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 23,
              child: SvgPicture.asset(
                "assets/images/person.svg",
                height: 30,
              ),
            ),
            contact.select!
                ? Positioned(
                    bottom: 4,
                    right: 5,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.check,
                        color: Colors.blueGrey,
                        size: 18,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      title: Text(
        contact.name!,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      subtitle: Text(
        contact.status!,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
