import 'package:clean_demo/config/app_routes/app_routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Bloc Clean Architecture',
      theme: ThemeData(primarySwatch: Colors.blue),
      routerConfig: router, // Using GoRouter
    );
  }
}
