import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phar_my/screens/common/loading_screen.dart';
import 'package:phar_my/theme/style.dart';
import 'package:phar_my/utils/notifiers.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
            appBarTheme: AppBarTheme(
                shadowColor: ThemeColors.transparan,
                backgroundColor: ThemeColors.white,
                centerTitle: true,
                systemOverlayStyle: SystemUiOverlayStyle.light,
                iconTheme: IconThemeData(color: ThemeColors.black)),
            scaffoldBackgroundColor: ThemeColors.white,
            primarySwatch: Colors.blue,
          ),
          home: Loadingscreen()),
    );
  }
}
