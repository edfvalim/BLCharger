import 'package:blcharger/features/charging_session/charging_session_view.dart';
import 'package:flutter/material.dart';
import 'package:blcharger/features/charger/charger_model.dart';

class ChargerView extends StatefulWidget {
  final ChargerModel charger;

  const ChargerView({
    super.key,
    required this.charger,
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
        title: Text(widget.charger.name),
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
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: AssetImage(widget.charger.imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                children: [
                  Text(
                    'ID: ${widget.charger.id}',
                    style: const TextStyle(fontSize: 9.0),
                  ),
                  Text(
                    widget.charger.description,
                    style: const TextStyle(fontSize: 18.0),
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
                const Text('Preço: '),
                Text(
                  'R\$ ${widget.charger.pricePerKwh.toStringAsFixed(2)}/kWh',
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(50, 50),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChargingSessionView(),
                  ),
                );
              },
              child: const Text('Iniciar Carregamento'),
            ),
          ],
        ),
      ),
    );
  }
}
