import 'package:blcharger/features/auth/login_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyApp',
      // TRY THIS: Try changing the theme here to a specific theme (to
      // ThemeData.dark(), perhaps?) and trigger a hot reload to see the theme
      // change while the other colors stay the same.
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const LoginView(),
    );
  }
}