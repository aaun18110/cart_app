import 'package:cart_app/product_screen.dart';
import 'package:cart_app/sharedpreferences.dart';
import 'package:flutter/material.dart';

void main() {
  SharedPref sp = SharedPref();
   sp.getCount();
  print('getcount${sp.getCount()}');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const ProductScreen(),
    );
  }
}
