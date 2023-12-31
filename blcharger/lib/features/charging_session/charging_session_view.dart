import 'package:flutter/material.dart';
import 'charging_session_data.dart';
import 'package:blcharger/features/charging_session/charge_summary_view.dart';

// Constants
const cardColor = Colors.deepPurple;
const paddingValue = 16.0;

class ChargingSessionView extends StatefulWidget {
  const ChargingSessionView({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ChargingSessionViewState createState() => _ChargingSessionViewState();
}

class _ChargingSessionViewState extends State<ChargingSessionView> {
  final sessionData = ChargingSessionData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Sessão de Carregamento'),
      ),
      body: Container(
        padding: const EdgeInsets.all(paddingValue),
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          padding: const EdgeInsets.all(paddingValue),
          mainAxisSpacing: paddingValue,
          crossAxisSpacing: paddingValue,
          children: <Widget>[
            _buildLiveCard(
              iconData: Icons.timer,
              label: 'Tempo decorrido:',
              stream: sessionData.elapsedTime,
              dataToString: (value) =>
                  value is Duration ? value.toString().split('.')[0] : '',
            ),
            _buildLiveCard(
              iconData: Icons.bolt,
              label: 'Energia consumida:',
              stream: sessionData.consumedPower,
              dataToString: (value) =>
                  value is double ? '${value.toStringAsFixed(2)} kWh' : '',
            ),
            _buildLiveCard(
              iconData: Icons.speed,
              label: 'Potência atual:',
              stream: sessionData.instantPower,
              dataToString: (value) =>
                  value is double ? '${value.toStringAsFixed(2)} kW' : '',
            ),
            _buildLiveCard(
              iconData: Icons.monetization_on,
              label: 'Valor atual:',
              stream: sessionData.instantPrice,
              dataToString: (value) =>
                  value is double ? 'R\$ ${value.toStringAsFixed(2)}' : '',
            ),
          ],
        ),
      ),
      floatingActionButton: _finalizeChargingSession(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _finalizeChargingSession() {
    return FloatingActionButton.extended(
      onPressed: () {
        final elapsedTime = sessionData.elapsedTime.value;
        final instantPower = sessionData.instantPower.value;
        final consumedPower = sessionData.consumedPower.value;
        final instantPrice = sessionData.instantPrice.value;

        dispose();

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChargeSummaryView(
            elapsedTime: elapsedTime,
            consumedPower: consumedPower,
            instantPower: instantPower,
            instantPrice: instantPrice,
          ),
        ));
      },
      label: const Text(
        'Finalizar carregamento',
        style: TextStyle(color: Colors.white),
      ),
      icon: const Icon(Icons.payment, color: Colors.white),
      backgroundColor: Colors.red,
    );
  }

  Widget _buildLiveCard({
    Color color = cardColor,
    required IconData iconData,
    required String label,
    required Stream<dynamic> stream,
    required String Function(dynamic value) dataToString,
  }) {
    return Card(
      color: color,
      child: Center(
        child: StreamBuilder<dynamic>(
          stream: stream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    iconData,
                    size: 48.0,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    dataToString(snapshot.data),
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
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
