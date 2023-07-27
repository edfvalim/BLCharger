import 'package:flutter/material.dart';

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
        title: const Text('Charger Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://hips.hearstapps.com/hmg-prod/images/gettyimages-1330280580.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.chargerDescription,
              style: const TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '\$${widget.pricePerKwh.toStringAsFixed(2)} / kWh',
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement your charging functionality here
                  },
                  child: const Text('Charge'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
