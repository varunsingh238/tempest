// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tempest/customUi/individualPage.dart';

import 'package:tempest/models/chatmodel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    Key? key,
    required this.chatModel,
  }) : super(key: key);
  final ChatModel chatModel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return IndividualPage(
            chatModel: chatModel,
          );
        }));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                chatModel.isGroup!
                    ? "assets/images/groups.svg"
                    : "assets/images/person.svg",
                height: 40,
                width: 40,
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 10, left: 10),
              child: Text(
                chatModel.name!,
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            trailing: Text(
              chatModel.time!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10),
              child: Text(
                chatModel.currentMessage!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(
              thickness: 1.5,
            ),
          )
        ],
      ),
    );
  }
}
