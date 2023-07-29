import 'package:flutter/material.dart';
import 'package:blcharger/features/charger/chargers_data.dart';

class ChargerView extends StatefulWidget {
  final String chargerPhotoUrl;
  final String chargerDescription;
  final double pricePerKwh;

  const ChargerView({
    super.key,
    required this.chargerPhotoUrl,
    required this.chargerDescription,
    required this.pricePerKwh,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ChargerViewState createState() => _ChargerViewState();
}

class _ChargerViewState extends State<ChargerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes deste carregador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image:
                        AssetImage(ChargersData.chargers[0].chargerImagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  Text('ID: ${ChargersData.chargers[0].id}'),
                  Text(
                    ChargersData.chargers[0].chargerDescription,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: [
                Text('Preço: '),
                Text(
                  'R\$ ${ChargersData.chargers[0].pricePerKwh.toStringAsFixed(2)}/kWh',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(50, 50),
              ),
              onPressed: () {
                // Implement your charging functionality here
              },
              child: const Text('Iniciar Carregamento'),
            ),
          ],
        ),
      ),
    );
  }
}
