import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lab_work_14_3/pages/add_contact_page.dart';
import 'package:lab_work_14_3/pages/detail_page.dart';
import 'package:lab_work_14_3/pages/first_page.dart';
import 'package:lab_work_14_3/pages/update_page.dart';
import 'package:lab_work_14_3/resurces/app_theme.dart';

void main() {
/*  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.red,
      systemNavigationBarColor: Colors.amber,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light));*/
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) => runApp(
        const HomePage(),
      ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /* theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle:
              SystemUiOverlayStyle(statusBarBrightness: Brightness.dark),
        ),
      ),*/
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (Context) => const MyApp(),
        '/add': (Context) => const add_contact_page(),
        '/detail': (Context) => const Detail_page(),
        '/update': (Context) => const Update_page(),
      },
    );
  }
}
