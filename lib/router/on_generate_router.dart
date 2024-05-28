import 'package:chat_app/features/app/const/page_const.dart';
import 'package:chat_app/features/app/home/contacts_home.dart';
import 'package:chat_app/features/app/settings/settings_page.dart';
import 'package:chat_app/features/call/presentation/pages/call_contacts_page.dart';
import 'package:chat_app/features/chat/presentation/pages/single_chat_page.dart';
import 'package:chat_app/features/status/presentation/pages/my_status_page.dart';
import 'package:flutter/material.dart';

class OnGenerateRouter {
  static Route<dynamic>? route(RouteSettings settings) {
    // final args = settings.arguments;
    final name = settings.name;

    switch (name) {
      case PageConst.contactUsersPage:
        {
          return materialPageRoute(const ContactsPage());
        }
      case PageConst.settingsPage:
        {
          return materialPageRoute(const SettingsPage());
        }
      case PageConst.myStatusPage:
        {
          return materialPageRoute(const MyStatusPage());
        }
      case PageConst.callContactsPage:
        {
          return materialPageRoute(const CallContactsPage());
        }
      case PageConst.singleChatPage:
        {
          return materialPageRoute(const SingleChatPage());
        }
    }
    return null;
  }
}

dynamic materialPageRoute(Widget widget) {
  return MaterialPageRoute(
    builder: (context) => widget,
  );
}
