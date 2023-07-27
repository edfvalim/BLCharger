import 'package:flutter/material.dart';

class CustomFAB extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function() onPressed;

  const CustomFAB(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.large(
      heroTag: key, //"FAB_${hashCode.toString()}",
      backgroundColor: Colors.deepPurple,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100, color: Colors.white),
          Text(label,
              style: const TextStyle(fontSize: 15, color: Colors.white)),
        ],
      ),
    );
  }
}
