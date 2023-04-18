import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tempest/customUi/individualPage.dart';
import 'package:tempest/models/chatmodel.dart';
import 'package:tempest/pages/contacct_card.dart';
import 'package:tempest/pages/createGroup.dart';

import 'buttonCard.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({super.key});

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<ChatModel> contacts = [
      ChatModel(
          name: "Kamado Tanjiro",
          icon: "person.svg",
          isGroup: false,
          status: "Demon Slayer"),
      ChatModel(
          name: "Gon",
          icon: "person.svg",
          isGroup: false,
          status: "hunter x hunter"),
      ChatModel(
          name: "Goku",
          icon: "person.svg",
          isGroup: false,
          status: "Dragon Ball"),
      ChatModel(
          name: "Vegeta",
          icon: "person.svg",
          isGroup: false,
          status: "Dragon Ball"),
      ChatModel(
          name: "Kiliua",
          icon: "person.svg",
          isGroup: false,
          status: "Hunter x Hunter"),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          title: Text(
            "Select Contact",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            AnimSearchBar(
                color: Theme.of(context).canvasColor,
                width: 300,
                textController: _textController,
                onSuffixTap: () {},
                onSubmitted: (String) {
                  return "Searching";
                }),
            PopupMenuButton<String>(
              onSelected: (value) {
                print(value);
              },
              itemBuilder: (BuildContext context) {
                return const [
                  PopupMenuItem(
                    value: 'Invite a Friend',
                    child: Text("Invite a Friend"),
                  ),
                  PopupMenuItem(
                    value: "Contacts",
                    child: Text("Contacts"),
                  ),
                  PopupMenuItem(
                    value: "Refresh",
                    child: Text("Refresh"),
                  ),
                  PopupMenuItem(
                    value: "Help",
                    child: Text("Help"),
                  ),
                ];
              },
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (builder) => CreateGroup()));
                    },
                    child: ButtonCard(icon: Icons.group, name: "New Group"));
              } else if (index == 1) {
                return InkWell(
                  onTap: () {
                    // Navigator.pushReplacement(
                    //     context,
                    //     CupertinoPageRoute(
                    //         builder: (builder) => const IndividualPage(
                    //             chatModel: contacts[index])));
                  },
                  child: ButtonCard(
                    icon: Icons.person,
                    name: "New Contact",
                  ),
                );
              }
              return ContactCard(contact: contacts[index - 2]);
            }),
      ),
    );
  }
}
