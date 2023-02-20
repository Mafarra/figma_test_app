import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/view/views/home/home_Screen.dart';
import 'features/view_model/cart_view_model.dart';

void main() {
  runApp(
  ChangeNotifierProvider(
      create: (context) => CartViewModel(),
      child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}
