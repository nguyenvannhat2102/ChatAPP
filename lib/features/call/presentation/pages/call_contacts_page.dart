import 'package:chat_app/features/app/global/widgets/profile_widget.dart';
import 'package:chat_app/features/app/theme/style.dart';
import 'package:flutter/material.dart';

class CallContactsPage extends StatefulWidget {
  const CallContactsPage({super.key});

  @override
  State<CallContactsPage> createState() => _CallContactsPageState();
}

class _CallContactsPageState extends State<CallContactsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("chọn liên hệ"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: profileWidget(),
              ),
            ),
            title: const Text("nhatnhinho"),
            subtitle: const Text("heeeeeeeeeee"),
            trailing: const Wrap(
              children: [
                Icon(
                  Icons.call,
                  color: tabColor,
                  size: 22,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.videocam_rounded,
                  color: tabColor,
                  size: 25,
                ),
              ],
            ),
          );
        },
        itemCount: 20,
      ),
    );
  }
}
