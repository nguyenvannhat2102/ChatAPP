import 'package:chat_app/features/app/global/widgets/profile_widget.dart';
import 'package:chat_app/features/app/home/home_page.dart';
import 'package:chat_app/features/app/theme/style.dart';
import 'package:flutter/material.dart';

class InitialProfileSubmitPage extends StatefulWidget {
  const InitialProfileSubmitPage({super.key});

  @override
  State<InitialProfileSubmitPage> createState() =>
      _InitialProfileSubmitPageState();
}

class _InitialProfileSubmitPageState extends State<InitialProfileSubmitPage> {
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "thông tin của bạn",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: tabColor,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "vui lòng cung cấp tên của bạn và ảnh hồ sơ tùy chọn",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {},
              child: SizedBox(
                width: 100,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: profileWidget(),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40,
              margin: const EdgeInsets.only(top: 1.5),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: tabColor, width: 1.5),
                ),
              ),
              child: TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    hintText: "Username", border: InputBorder.none),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (route) => false);
              },
              child: Container(
                width: 150,
                height: 40,
                decoration: BoxDecoration(
                  color: tabColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Center(
                  child: Text(
                    "Tiếp tục",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
