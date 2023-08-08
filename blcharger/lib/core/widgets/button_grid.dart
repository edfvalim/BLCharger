import 'package:blcharger/features/chargers_list/chargers_list_view.dart';
import 'package:flutter/material.dart';
import 'package:blcharger/core/widgets/custom_fab.dart';
import 'package:blcharger/features/qr_code_scanner/qr_code_scanner_view.dart';
import 'package:go_router/go_router.dart';

class ButtonGrid extends StatelessWidget {
  const ButtonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 20,
      ),
      height: 500,
      width: 500,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        children: [
          CustomFAB(
            icon: Icons.qr_code_scanner,
            label: 'Escanear QR Code',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QRCodeScanner(),
                ),
              );
            },
          ),
          CustomFAB(
            icon: Icons.map,
            label: 'Procurar no mapa',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const QRCodeScanner(),
                ),
              );
            },
          ),
          CustomFAB(
            icon: Icons.list,
            label: 'Procurar na lista',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChargersListView(),
                ),
              );
            },
          ),
          CustomFAB(
            icon: Icons.settings,
            label: 'Ajustes',
            onPressed: () {
              context.push('/profile');
            },
          ),
        ],
      ),
    );
  }
}
