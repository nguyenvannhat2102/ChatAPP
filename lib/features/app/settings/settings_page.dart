import 'package:chat_app/features/app/global/widgets/profile_widget.dart';
import 'package:chat_app/features/app/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("cài đặt"),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 65,
                  width: 65,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32.5),
                    child: profileWidget(),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "nhatnhinho",
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        "hhhhhhhhhhhh",
                        style: TextStyle(color: greyColor),
                      )
                    ],
                  ),
                ),
                const Icon(
                  Icons.qr_code,
                  color: tabColor,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Container(
            width: double.infinity,
            height: 0.5,
            color: greyColor.withOpacity(.4),
          ),
          const SizedBox(
            height: 10,
          ),
          _settingsItemWidget(
            title: "Tài Khoản",
            description: "bảo mật ứng dụng, thay đổi số điện thoại",
            iconData: Icons.key,
            onTap: () {},
          ),
          _settingsItemWidget(
            title: "Riêng tư",
            description: "chặn liên lạc, tin nhắn biến mất",
            iconData: Icons.lock,
            onTap: () {},
          ),
          _settingsItemWidget(
            title: "Tin Nhắn",
            description: "chủ đề, lịch sử tin nhắn",
            iconData: Icons.message,
            onTap: () {},
          ),
          _settingsItemWidget(
            title: "Đăng Xuất",
            description: "bảo mật ứng dụng, thay đổi số điện thoại",
            iconData: Icons.exit_to_app,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _settingsItemWidget(
      {String? title,
      String? description,
      IconData? iconData,
      VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Icon(
              iconData,
              color: greyColor,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title",
                  style: const TextStyle(fontSize: 17),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  "$description",
                  style: const TextStyle(color: greyColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
