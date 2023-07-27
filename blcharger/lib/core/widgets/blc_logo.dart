import 'package:flutter/material.dart';

class BLCLogo extends StatelessWidget {
  final double logoSize;

  const BLCLogo({
    super.key,
    required this.logoSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          Icons.ev_station_rounded,
          size: logoSize,
          color: Colors.deepPurple,
        ),
        Text(
          'BLCharger',
          style: TextStyle(
            fontSize: logoSize / 5,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ],
    );
  }
}
