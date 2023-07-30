import 'package:flutter/material.dart';
import 'charging_session_data.dart';

class ChargeSummaryView extends StatefulWidget {
  final ChargingSessionData sessionData;

  ChargeSummaryView({required this.sessionData});

  @override
  _ChargeSummaryViewState createState() => _ChargeSummaryViewState();
}

class _ChargeSummaryViewState extends State<ChargeSummaryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resumo da Sessão'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            height: 200,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Tempo decorrido: ', style: TextStyle(fontSize: 20.0)),
                Text('Energia consumida: ', style: TextStyle(fontSize: 20.0)),
                Text('Preço total: ', style: TextStyle(fontSize: 20.0)),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) => ChargeSummaryView(sessionData: sessionData),
          // ));
        },
        label: const Text('Pagar'),
        icon: const Icon(Icons.stop),
        backgroundColor: Colors.red,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
