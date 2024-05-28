import 'package:chat_app/features/app/const/page_const.dart';
import 'package:chat_app/features/app/global/widgets/profile_widget.dart';
import 'package:chat_app/features/app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageConst.singleChatPage);
            },
            child: ListTile(
              leading: SizedBox(
                width: 50,
                height: 50,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: profileWidget(),
                ),
              ),
              title: const Text("nhatnhinho"),
              subtitle: const Text(
                "last name hi",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                DateFormat.jm().format(DateTime.now()),
                style: const TextStyle(color: greyColor, fontSize: 13),
              ),
            ),
          );
        },
      ),
    );
  }
}
