import 'package:flutter/material.dart';
import 'package:gorcery_app/pages/introPage.dart';
import 'package:provider/provider.dart';

import 'Models/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.green)),
        home: IntroPage(),
      ),
    );
  }
}
