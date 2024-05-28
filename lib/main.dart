import 'package:chat_app/features/app/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_app/features/app/theme/style.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:chat_app/router/on_generate_router.dart';
import 'package:flutter/material.dart';
import 'main_injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
          dialogBackgroundColor: appBarColor,
          appBarTheme: const AppBarTheme(color: appBarColor)),
      initialRoute: "/",
      onGenerateRoute: OnGenerateRouter.route,
      routes: {
        "/": (context) => const SplashScreen(),
      },
    );
  }
}
