import 'package:chat_app/features/app/global/date/date_formats.dart';
import 'package:chat_app/features/app/global/widgets/profile_widget.dart';
import 'package:chat_app/features/app/theme/style.dart';
import 'package:flutter/material.dart';

class CallHistoryPage extends StatelessWidget {
  const CallHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Recent",
                style: TextStyle(
                  fontSize: 15,
                  color: greyColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ListView.builder(
              itemCount: 20,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: profileWidget(),
                    ),
                  ),
                  title: const Text(
                    "nhatnhinho",
                    style: TextStyle(fontSize: 15),
                  ),
                  subtitle: Row(
                    children: [
                      const Icon(
                        Icons.call_made,
                        color: Colors.green,
                        size: 19,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(formatDateTime(DateTime.now()))
                    ],
                  ),
                  trailing: const Icon(
                    Icons.call,
                    color: tabColor,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
