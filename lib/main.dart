import 'package:bmi/provider/functionality.dart';
import 'package:flutter/material.dart';
import 'mainScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<Function_operation>(
        create: (_) => Function_operation(),
      )
    ],
    child: MaterialApp(home: Provider_screen()),
  ));
}

class Provider_screen extends StatelessWidget {
  const Provider_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff0a0e21),
        ),
        scaffoldBackgroundColor: const Color(0xff0a0e21),
      ),
      home: MyApp(),
    );
  }
}
