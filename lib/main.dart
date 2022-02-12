import 'package:flutter/material.dart';
import 'package:phar_my/screens/app_pageview.dart';
import 'package:phar_my/screens/onboarding_carousel_screen.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppNotifier(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          darkTheme: ThemeData.light(),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AppPageview()),
    );
  }
}
