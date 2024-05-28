import 'package:chat_app/features/app/global/widgets/profile_widget.dart';
import 'package:chat_app/features/app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as time_ago;

class MyStatusPage extends StatefulWidget {
  const MyStatusPage({super.key});

  @override
  State<MyStatusPage> createState() => _MyStatusPageState();
}

class _MyStatusPageState extends State<MyStatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("trạng thái của tôi"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: profileWidget(),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Text(
                    time_ago.format(
                      DateTime.now().subtract(
                        Duration(seconds: DateTime.now().second),
                      ),
                    ),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ),
                PopupMenuButton<String>(
                  icon: Icon(
                    Icons.more_horiz,
                    color: greyColor.withOpacity(.5),
                  ),
                  iconSize: 28,
                  onSelected: (value) {},
                  itemBuilder: (context) => <PopupMenuEntry<String>>[
                    PopupMenuItem<String>(
                      value: "Xóa",
                      child: GestureDetector(
                        onTap: () {},
                        child: const Text("xóa"),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
