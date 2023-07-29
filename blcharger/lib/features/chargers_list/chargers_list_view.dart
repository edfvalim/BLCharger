import 'package:blcharger/features/charger/charger_view.dart';
import 'package:blcharger/features/charger/chargers_data.dart';
import 'package:flutter/material.dart';

class ChargersListView extends StatelessWidget {
  ChargersListView({super.key});

  final titles = [
    "Carregador 1",
    "Carregador 2",
    "Carregador 3",
    "Carregador 4",
    "Carregador 5",
    "Carregador 6"
  ];
  final subtitles = [
    "Legenda Carregador 1",
    "Legenda Carregador 2",
    "Legenda Carregador 3",
    "Legenda Carregador 4",
    "Legenda Carregador 5",
    "Legenda Carregador 6",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolha um carregador'),
      ),
      body: ListView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChargerView(
                      chargerPhotoUrl:
                          'https://hips.hearstapps.com/hmg-prod/images/gettyimages-1330280580.jpg',
                      chargerDescription: subtitles[index],
                      pricePerKwh: 12.2,
                    ),
                  ),
                );
              },
              title: Text(
                'Carregador ${index + 1}',
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                'ID: ${ChargersData.chargers[index].id}',
                style: const TextStyle(fontSize: 15),
              ),
              leading: CircleAvatar(
                backgroundImage:
                    AssetImage(ChargersData.chargers[index].chargerImagePath),
                radius: 30,
              ),
              trailing: Icon(
                Icons.circle_rounded,
                color: ChargersData.chargers[index].isAvailable
                    ? Colors.green
                    : Colors.red,
              ),
            ),
          );
        },
      ),
    );
  }
}
