import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tempest/api/api.dart';
import 'package:tempest/customUi/customCard.dart';
import 'package:tempest/customUi/selectContacts.dart';
import 'package:tempest/models/chatmodel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Varun Singh",
        icon: "people.svg",
        isGroup: false,
        time: "20:00",
        currentMessage: "Hi how are you"),
    ChatModel(
        name: "Varun Singh",
        icon: "people.svg",
        isGroup: false,
        time: "20:00",
        currentMessage: "Hi how are you"),
    ChatModel(
        name: "Varun Singh",
        icon: "people.svg",
        isGroup: false,
        time: "20:00",
        currentMessage: "Hi how are you"),
  ];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => const SelectContact(),
              ),
            );
          },
          child: const Icon(Icons.chat),
        ),
        body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) =>
                CustomCard(chatModel: (chats[index]))));
  }
}
