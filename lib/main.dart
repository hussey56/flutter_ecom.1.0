import 'dart:js';

import 'package:ecom2/models/shop.dart';
import 'package:ecom2/pages/CartPage.dart';
import 'package:ecom2/pages/IntroScreen.dart';
import 'package:ecom2/pages/ShopPage.dart';
import 'package:ecom2/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context)=>Shop(),
    child: const MyApp(),)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const  IntroScreen(),
      theme: lightMode,
      routes: {
        '/intro': (context) => const IntroScreen(),
        '/shop':(context)=>const ShopPage(),
        '/cart':(context)=> const CartPage(),
      },
    );
  }
}

