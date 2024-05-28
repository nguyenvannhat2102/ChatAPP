import 'package:chat_app/features/app/theme/style.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:swipe_to/swipe_to.dart';

class SingleChatPage extends StatefulWidget {
  const SingleChatPage({super.key});

  @override
  State<SingleChatPage> createState() => _SingleChatPageState();
}

class _SingleChatPageState extends State<SingleChatPage> {
  final _textMessageController = TextEditingController();
  bool _isDisplaySendButton = false;
  bool _isShowAttachWindow = false;

  @override
  void dispose() {
    _textMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("nhatnhinho"),
            Text(
              "online",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500),
            )
          ],
        ),
        actions: const [
          Icon(
            Icons.videocam_rounded,
            size: 25,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.call,
            size: 22,
          ),
          SizedBox(
            width: 25,
          ),
          Icon(
            Icons.more_horiz,
            size: 22,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          setState(() {
            _isShowAttachWindow = false;
          });
        },
        child: Stack(
          children: [
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              top: 0,
              child: Image.asset(
                "assets/whatsapp_bg_image.png",
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      _messageLayout(
                        message: "hello",
                        alignment: Alignment.centerRight,
                        createAt: Timestamp.now(),
                        isSeen: false,
                        isShowTick: true,
                        messageBgColor: messageColor,
                        onLongPress: () {},
                        onSwipe: (p0) {},
                      ),
                      _messageLayout(
                        message: "how are you",
                        alignment: Alignment.centerRight,
                        createAt: Timestamp.now(),
                        isSeen: false,
                        isShowTick: true,
                        messageBgColor: messageColor,
                        onLongPress: () {},
                        onSwipe: (p0) {},
                      ),
                      _messageLayout(
                        message: "hi",
                        alignment: Alignment.centerLeft,
                        createAt: Timestamp.now(),
                        isSeen: false,
                        isShowTick: false,
                        messageBgColor: senderMessageColor,
                        onLongPress: () {},
                        onSwipe: (p0) {},
                      ),
                      _messageLayout(
                        message: "doing good, how about you",
                        alignment: Alignment.centerLeft,
                        createAt: Timestamp.now(),
                        isSeen: false,
                        isShowTick: false,
                        messageBgColor: senderMessageColor,
                        onLongPress: () {},
                        onSwipe: (p0) {},
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    top: 5,
                    bottom: 5,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: appBarColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          height: 50,
                          child: TextField(
                            controller: _textMessageController,
                            onTap: () {
                              setState(() {
                                _isShowAttachWindow = false;
                              });
                            },
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                setState(() {
                                  _isDisplaySendButton = true;
                                });
                              } else {
                                setState(() {
                                  _isDisplaySendButton = false;
                                });
                              }
                            },
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(vertical: 15),
                              prefixIcon: const Icon(
                                Icons.emoji_emotions_outlined,
                                color: greyColor,
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Wrap(
                                  children: [
                                    Transform.rotate(
                                      angle: -0.5,
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isShowAttachWindow =
                                                !_isShowAttachWindow;
                                          });
                                        },
                                        child: const Icon(
                                          Icons.attach_file,
                                          color: greyColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    const Icon(
                                      Icons.camera_alt,
                                      color: greyColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                              ),
                              hintText: "soạn tin",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: tabColor,
                        ),
                        child: Center(
                          child: Icon(
                            _isDisplaySendButton
                                ? Icons.send_outlined
                                : Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            _isShowAttachWindow == true
                ? Positioned(
                    bottom: 65,
                    top: 340,
                    left: 15,
                    right: 15,
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width * 0.2,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 20),
                      decoration: BoxDecoration(
                        color: bottomAttachContainerColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _attachWindowItem(
                                icon: Icons.document_scanner,
                                color: Colors.deepPurple,
                                title: "document",
                              ),
                              _attachWindowItem(
                                icon: Icons.camera_alt,
                                color: Colors.pinkAccent,
                                title: "camera",
                              ),
                              _attachWindowItem(
                                icon: Icons.image,
                                color: Colors.purpleAccent,
                                title: "document",
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _attachWindowItem(
                                icon: Icons.headphones,
                                color: Colors.deepOrange,
                                title: "audio",
                              ),
                              _attachWindowItem(
                                icon: Icons.location_on,
                                color: Colors.green,
                                title: "location",
                              ),
                              _attachWindowItem(
                                icon: Icons.account_circle,
                                color: Colors.deepPurpleAccent,
                                title: "contact",
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _attachWindowItem(
                                icon: Icons.bar_chart,
                                color: tabColor,
                                title: "poll",
                              ),
                              _attachWindowItem(
                                icon: Icons.gif_box_outlined,
                                color: Colors.indigoAccent,
                                title: "gif",
                              ),
                              _attachWindowItem(
                                icon: Icons.video_call,
                                color: Colors.blueGrey,
                                title: "Video",
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                : Container()
          ],
        ),
      ),
    );
  }

  Widget _attachWindowItem(
      {IconData? icon, Color? color, String? title, VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 65,
            height: 65,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: color,
            ),
            child: Icon(icon),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "$title",
            style: const TextStyle(color: greyColor, fontSize: 13),
          )
        ],
      ),
    );
  }

  Widget _messageLayout({
    Color? messageBgColor,
    Alignment? alignment,
    Timestamp? createAt,
    // VoidCallback? onSwipe,
    void Function(DragUpdateDetails)? onSwipe,
    String? message,
    // String? messageType,
    bool? isShowTick,
    bool? isSeen,
    VoidCallback? onLongPress,
    // MessageReplayEntity? reply,
    // double? rightPadding
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SwipeTo(
        onRightSwipe: onSwipe,
        child: GestureDetector(
          onLongPress: onLongPress,
          child: Container(
            alignment: alignment,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.only(
                        left: 5,
                        right: 85,
                        top: 5,
                        bottom: 5,
                      ),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.8,
                      ),
                      decoration: BoxDecoration(
                        color: messageBgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "$message",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 4,
                  right: 10,
                  child: Row(
                    children: [
                      Text(
                        DateFormat.jm().format(createAt!.toDate()),
                        style: const TextStyle(fontSize: 12, color: greyColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      isShowTick == true
                          ? Icon(
                              isSeen == true ? Icons.done_all : Icons.done,
                              size: 16,
                              color: isSeen == true ? Colors.blue : greyColor,
                            )
                          : Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
