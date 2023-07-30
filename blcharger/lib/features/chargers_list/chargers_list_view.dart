import 'package:blcharger/features/charger/charger_view.dart';
import 'package:blcharger/features/charger/chargers_data.dart';
import 'package:blcharger/features/charger/charger_model.dart';
import 'package:flutter/material.dart';

class ChargersListView extends StatelessWidget {
  ChargersListView({super.key}) {
    ChargersData.populateChargers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha um carregador'),
      ),
      body: ListView.builder(
        itemCount: ChargersData.chargers.length,
        itemBuilder: (BuildContext context, int index) {
          String key = ChargersData.chargerIds[index];
          ChargerModel? currentCharger = ChargersData.chargers[key];

          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChargerView(charger: currentCharger),
                  ),
                );
              },
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(currentCharger!.imagePath),
              ),
              title: Text(
                'Carregador ${index + 1}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                'ID: ${currentCharger.id}',
                style: const TextStyle(
                  fontSize: 8,
                ),
              ),
              trailing: Icon(
                Icons.circle_rounded,
                color: currentCharger.isAvailable ? Colors.green : Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
