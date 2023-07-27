import 'package:flutter/material.dart';
import 'package:blcharger/core/widgets/blc_logo.dart';
import 'package:blcharger/features/home/widgets/button_grid.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HomePageView',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BLCLogo(logoSize: 130),
              ButtonGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
