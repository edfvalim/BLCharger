import 'package:flutter/material.dart';
import 'charging_session_data.dart';
import 'package:blcharger/features/charging_session/charge_summary_view.dart';

class ChargingSessionView extends StatefulWidget {
  @override
  _ChargingSessionViewState createState() => _ChargingSessionViewState();
}

class _ChargingSessionViewState extends State<ChargingSessionView> {
  final sessionData = ChargingSessionData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sessão de Carregamento'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio:
              0.75, // Adjust this value to change the size of the squares.
          padding: EdgeInsets.all(16.0),
          mainAxisSpacing: 16.0,
          crossAxisSpacing: 16.0,
          children: <Widget>[
            _buildLiveCard(
              color: Colors.deepPurple,
              iconData: Icons.timer,
              label: 'Tempo Decorrido',
              stream: sessionData.elapsedTime,
              dataToString: (value) =>
                  value is Duration ? value.toString().split('.')[0] : '',
            ),
            _buildLiveCard(
              color: Colors.deepPurple,
              iconData: Icons.bolt,
              label: 'Energia Consumida',
              stream: sessionData.powerConsumed,
              dataToString: (value) =>
                  value is double ? '${value.toStringAsFixed(2)} kWh' : '',
            ),
            _buildLiveCard(
              color: Colors.deepPurple,
              iconData: Icons.speed,
              label: 'Potência Atual',
              stream: sessionData.currentPower,
              dataToString: (value) =>
                  value is double ? '${value.toStringAsFixed(2)} kW' : '',
            ),
            _buildLiveCard(
              color: Colors.deepPurple,
              iconData: Icons.monetization_on,
              label: 'Preço Atual',
              stream: sessionData.currentPrice,
              dataToString: (value) =>
                  value is double ? 'R\$ ${value.toStringAsFixed(2)}' : '',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ChargeSummaryView(sessionData: sessionData),
          ));
        },
        label: const Text('Finalizar carregamento'),
        icon: const Icon(Icons.stop),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildLiveCard({
    required Color color,
    required IconData iconData,
    required String label,
    required Stream stream,
    required String Function(dynamic value) dataToString,
  }) {
    return Card(
      color: color,
      child: Center(
        child: StreamBuilder(
          stream: stream,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment:
                    CrossAxisAlignment.center, // This should center the text.
                children: <Widget>[
                  Icon(
                    iconData,
                    size:
                        40.0, // Adjust this value to change the size of the icons.
                    color: Colors.white,
                  ),
                  const SizedBox(
                      height:
                          10.0), // Creates a bit of space between the icon and the text.
                  Text(
                    label,
                    style: const TextStyle(fontSize: 18.0, color: Colors.white),
                    textAlign: TextAlign
                        .center, // This should center the text within the Text widget.
                  ),
                  Text(
                    dataToString(snapshot.data),
                    style: const TextStyle(fontSize: 16.0, color: Colors.white),
                    textAlign: TextAlign
                        .center, // This should center the text within the Text widget.
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    sessionData.dispose();
    super.dispose();
  }
}
