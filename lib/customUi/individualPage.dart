// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:tempest/models/chatmodel.dart';
import 'package:tempest/pages/camera_screen.dart';

class IndividualPage extends StatefulWidget {
  const IndividualPage({
    Key? key,
    required this.chatModel,
  }) : super(key: key);
  final ChatModel chatModel;

  @override
  State<IndividualPage> createState() => _IndividualPageState();
}

bool _isShowing = false;

class _IndividualPageState extends State<IndividualPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: WillPopScope(
        onWillPop: () {
          if (_isShowing) {
            setState(() {
              _isShowing = false;
            });
          } else {
            Navigator.pop(context);
          }
          return Future.value(false);
        },
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.videocam),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.call),
                  ),
                  PopupMenuButton(onSelected: (value) {
                    print(value);
                  }, itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                          child: Text(
                        "View contact",
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                      PopupMenuItem(
                          child: Text(
                        "Media,links,and docs",
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                      PopupMenuItem(
                          child: Text(
                        "Search",
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                      PopupMenuItem(
                          child: Text(
                        "Wallpaper",
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                      PopupMenuItem(
                          child: Text(
                        "More",
                        style: Theme.of(context).textTheme.titleMedium,
                      )),
                    ];
                  })
                ],
                titleSpacing: 0,
                leadingWidth: 70,
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blueGrey,
                        child: SvgPicture.asset(
                          widget.chatModel.isGroup!
                              ? "assets/images/groups.svg"
                              : "assets/images/person.svg",
                          height: 30,
                          width: 30,
                        ),
                      )
                    ],
                  ),
                ),
                title: Container(
                  margin: const EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.chatModel.name!,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Text(
                          "last seen today at ${widget.chatModel.time}",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                )),
            body: const Body(),
          ),
        ),
      ),
    );
  }
}

//Body work

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController _controller = TextEditingController();
  FocusNode foccusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foccusNode.addListener(() {
      if (foccusNode.hasFocus) {
        setState(() {
          _isShowing = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget iconCreate(IconData icon, Color color, String text) {
      return InkWell(
        onTap: () {},
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: color,
              radius: 30,
              child: Icon(icon, size: 29, color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
      );
    }

    Widget bottomSheet() {
      return Container(
        height: MediaQuery.of(context).size.height * .4,
        width: MediaQuery.of(context).size.width,
        child: Card(
          margin: const EdgeInsets.all(18),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreate(
                        Icons.insert_drive_file, Colors.indigo, "Document"),
                    const SizedBox(
                      width: 40,
                    ),
                    iconCreate(Icons.camera_alt, Colors.pink, "Camera"),
                    const SizedBox(
                      width: 40,
                    ),
                    iconCreate(Icons.insert_photo, Colors.purple, "Gallery"),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    iconCreate(Icons.headphones, Colors.orange, "Audio"),
                    const SizedBox(
                      width: 40,
                    ),
                    iconCreate(Icons.location_pin,
                        const Color.fromARGB(255, 22, 131, 27), "Location"),
                    const SizedBox(
                      width: 40,
                    ),
                    iconCreate(Icons.person, Colors.blue, "Contact"),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          ListView(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 55,
                      child: TextFormField(
                        controller: _controller,
                        focusNode: foccusNode,
                        textAlignVertical: TextAlignVertical.center,
                        maxLines: 100,
                        minLines: 1,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                            prefixIcon: IconButton(
                                onPressed: () {
                                  foccusNode.unfocus();
                                  foccusNode.canRequestFocus = false;
                                  setState(() {
                                    _isShowing = !_isShowing;
                                  });
                                },
                                icon: const Icon(CupertinoIcons.smiley)),
                            hintText: "Type a message",
                            contentPadding: const EdgeInsets.all(5),
                            //  border: InputBorder.none,
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                          backgroundColor: Colors.transparent,
                                          context: context,
                                          builder: (builder) => bottomSheet());
                                    },
                                    icon: const Icon(Icons.attach_file)),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          CupertinoPageRoute(
                                              builder: (context) =>
                                                  CameraScreen()));
                                    },
                                    icon: const Icon(CupertinoIcons.camera))
                              ],
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        radius: 25,
                        child: IconButton(
                          color: Colors.white,
                          icon: const Icon(CupertinoIcons.mic),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                if (_isShowing)
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .35,
                    child: EmojiPicker(
                        textEditingController: _controller,
                        config: Config(
                            bgColor: Theme.of(context).canvasColor,
                            columns: 8,
                            emojiSizeMax: 32 * (Platform.isIOS ? 1.30 : 1.0))),
                  )
              ],
            ),
          )
        ],
      ),
    );
  }
}
