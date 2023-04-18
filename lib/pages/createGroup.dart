import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:tempest/customUi/groupavataar.dart';
import 'package:tempest/models/chatmodel.dart';
import 'package:tempest/pages/contacct_card.dart';

class CreateGroup extends StatefulWidget {
  const CreateGroup({super.key});

  @override
  State<CreateGroup> createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup> {
  TextEditingController _textController = TextEditingController();

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
  List<ChatModel> groups = [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "New Group",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                "Add Participants",
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
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
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
                itemCount: contacts.length + 1,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return Container(
                      height: groups.length > 0
                          ? MediaQuery.of(context).size.height * .09
                          : 10,
                    );
                  }
                  return InkWell(
                      onTap: () {
                        if (contacts[index - 1].select == false) {
                          setState(() {
                            contacts[index - 1].select = true;
                            groups.add(contacts[index - 1]);
                          });
                        } else {
                          setState(() {
                            contacts[index - 1].select = false;
                            groups.remove(contacts[index - 1]);
                          });
                        }
                      },
                      child: ContactCard(contact: contacts[index - 1]));
                }),
            groups.length > 0
                ? Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.09,
                        color: Theme.of(context).canvasColor,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: contacts.length,
                            itemBuilder: (context, index) {
                              if (contacts[index].select == true) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      groups.remove(contacts[index]);
                                      contacts[index].select = false;
                                    });
                                  },
                                  child: GroupAvatar(
                                    contacts: contacts[index],
                                  ),
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ),
                      Divider(
                        thickness: 1,
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
