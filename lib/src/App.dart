import 'package:flutter/material.dart';

import 'views/add_page.dart';
import 'views/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrudDo List',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/create': (context) => const AddPage(),
      },
    );
  }
}
