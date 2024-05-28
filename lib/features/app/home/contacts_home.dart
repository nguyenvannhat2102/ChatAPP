import 'package:chat_app/features/app/global/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("chon lien he"),
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
          );
        },
        itemCount: 20,
      ),
    );
  }
}
