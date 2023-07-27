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
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${titles[index]}apertado'),
                  ),
                );
              },
              title: Text(
                titles[index],
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                subtitles[index],
                style: const TextStyle(fontSize: 15),
              ),
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://hips.hearstapps.com/hmg-prod/images/gettyimages-1330280580.jpg"),
                radius: 30,
              ),
              trailing: const Icon(
                Icons.circle_rounded,
                color: Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }
}
