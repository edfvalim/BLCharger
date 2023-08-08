import 'package:flutter/material.dart';
import 'package:blcharger/core/widgets/blc_logo.dart';
import 'package:blcharger/core/widgets/button_grid.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BLCLogo(logoSize: 130),
            ButtonGrid(),
          ],
        ),
      ),
    );
  }
}
