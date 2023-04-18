import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

import 'package:tempest/pages/chat_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TextEditingController textController = TextEditingController();
  TabController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
            color: Theme.of(context).backgroundColor,
          ),
          backgroundColor: Theme.of(context).canvasColor,
          centerTitle: true,
          title: Text(
            'Tempest',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          actions: [
            AnimSearchBar(
              color: Theme.of(context).canvasColor,
              width: 300,
              textController: textController,
              onSuffixTap: () {},
              onSubmitted: (String) {
                return "Searching";
              },
            ),
          ],
          bottom: TabBar(
            controller: _controller,
            tabs: [
              Tab(
                child: Text(
                  "CHATS",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Tab(
                child: Text(
                  "STATUS",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Tab(
                child: Text(
                  "CALLS",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            ChatPage(),
            Text("Status"),
            Text("Calls"),
          ],
        ),
      ),
    );
  }
}
