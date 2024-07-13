import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timbu_design_app/models/product_model.dart';
import 'package:timbu_design_app/screens/storepage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductModel(),
      child: const MyApp(),
    ),
    
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47)),
      home: const StorePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
