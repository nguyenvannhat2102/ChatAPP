import 'package:chat_app/features/app/const/page_const.dart';
import 'package:chat_app/features/app/global/date/date_formats.dart';
import 'package:chat_app/features/app/global/widgets/profile_widget.dart';
import 'package:chat_app/features/app/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatusPage extends StatelessWidget {
  const StatusPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      width: 60,
                      height: 60,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: profileWidget(),
                      ),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 8,
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                          color: tabColor,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 2, color: backgroundColor),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "my status",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "tap to add your status update",
                        style: TextStyle(color: greyColor),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageConst.myStatusPage);
                  },
                  child: Icon(
                    Icons.more_horiz,
                    color: greyColor.withOpacity(.5),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Rêcnt update",
                style: TextStyle(
                  color: greyColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Container(
                    margin: const EdgeInsets.all(8),
                    width: 40,
                    height: 40,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: profileWidget(),
                    ),
                  ),
                  title: const Text(
                    "nhatnhinho",
                    style: TextStyle(fontSize: 16),
                  ),
                  subtitle: Text(
                    formatDateTime(DateTime.now()),
                  ),
                );
              },
              itemCount: 10,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
            )
          ],
        ),
      ),
    );
  }
}
